#!/usr/bin/env python

from argparse import ArgumentParser, FileType

class FindLackLine:
    def __init__(self, targetFile, sourceFile):
        self.tfLines = targetFile.readlines()
        self.sfLines = sourceFile.readlines()

    def findLack(self):
        for tfl in self.tfLines:
            if tfl not in self.sfLines:
                print(tfl)

def parse_cmdline():
    """parse command line arguments"""
    parser = ArgumentParser(
        description='find the lack lines of targetFile which in sourceFile'
        )
    parser.add_argument(
        '--target',
        help='path to targetFile',
        type=FileType('r'),
        required=True)
    parser.add_argument(
            '--src', 
            help='path to sourceFile', 
            type=FileType('r'),
            required=True)
    return parser.parse_args()

def main():
    args = parse_cmdline()
    print(args.target, args.src)
    fll = FindLackLine(args.target, args.src)
    fll.findLack()


if __name__ == '__main__':
    main()
