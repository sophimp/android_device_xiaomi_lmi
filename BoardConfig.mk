
DEVICE_PATH := device/xiaomi/lmi
BOARD_VENDOR := xiaomi

# Security patch level
VENDOR_SECURITY_PATCH := 2019-11-17

ifeq ($(SHIPPING_API_LEVEL),29)
BOARD_SYSTEMSDK_VERSIONS:=29
endif

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a75
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_USES_64_BIT_BINDER := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_BASE := 0x0000
# get from unpack authentication boot.img
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm
#BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm buildvariant=eng
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1d84000.ufshc
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
#BOARD_KERNEL_CMDLINE += androidboot.vbmeta.avb_version=2.0
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_OFFSET := 0x00008000
TARGET_KERNEL_ARCH := arm64

#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8250
TARGET_KERNEL_CONFIG := lmi_user_defconfig

TARGET_KERNEL_CLANG_COMPILE := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)/prebuilt/Qualcomm_kona_integrate.dtb
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board ""

BOARD_KERNEL_SEPARATED_DTBO := false # TODO: set to true when we build our own kernel

BOARD_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS += kona
TARGET_BOARD_PLATFORM := kona
TARGET_BOARD_PLATFORM_GPU := qcom-adreno650

BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := existing_folders metadata

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_USERDATAIMAGE_PARTITION_SIZE := 118154457088
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product vendor odm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 16384
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_METADATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
BUILD_WITHOUT_VENDOR := true


BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 2

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
#BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# 非A/B更新
#BOARD_AB_UPDATE := false

# Sepolicy
-include device/qcom/sepolicy/sepolicy.mk
-include device/lineage/qcom/sepolicy/sepolicy.mk
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/private \
    device/qcom/sepolicy/qva/private

#BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/public \
    device/qcom/sepolicy/qva/public

#PRODUCT_PUBLIC_SEPOLICY_DIRS += \
    device/qcom/sepolicy/product/public \

PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/private

	#device/qcom/sepolicy/product/private \

# HIDL
DDEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
#DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vendor.qti.hardware.display.composer-service.xml
DEVICE_FRAMEWORK_MANIFEST_FILE += $(DEVICE_PATH)/framework_manifest.xml

# Telephony
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Treble
BOARD_VNDK_VERSION := current

BOARD_USES_SYSTEM_AS_ROOT := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
#TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# CNE and DPM
BOARD_USES_QCNE := true

# Display
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := true
#GNSS_HIDL_VERSION := 1.1
TARGET_NO_RPC := true
#USE_DEVICE_SPECIFIC_GPS := true

# NFC
TARGET_USES_NQ_NFC := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
TARGET_RIL_VARIANT := caf
TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD := true

# WiFi
#BOARD_WLAN_DEVICE := qcwcn
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
#WIFI_DRIVER_DEFAULT := qca_cld3
#WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
#WIFI_DRIVER_STATE_OFF := "OFF"
#WIFI_DRIVER_STATE_ON := "ON"
#WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
#WPA_SUPPLICANT_VERSION := VER_0_8_X

BOARD_USES_PRODUCTIMAGE := true

# Encryption
#TARGET_HW_DISK_ENCRYPTION := true

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

PRODUCT_FULL_TREBLE_OVERRIDE := true

# Init
ARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_lmi
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
#TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_msm
TARGET_RECOVERY_DEVICE_MODULES := libinit_lmi

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

# Power
TARGET_RPM_MASTER_STAT := "/d/rpmh/master_stats"
TARGET_RPM_STAT := "/d/rpmh/stats"
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"
TARGET_WLAN_POWER_STAT := "/sys/kernel/wlan/power_stats"

USE_OPENGL_RENDERER := true

#BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/audio_apr.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_pdr.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_notifier.ko \
    $(KERNEL_MODULES_OUT)/audio_adsp_loader.ko \
    $(KERNEL_MODULES_OUT)/audio_q6.ko \
    $(KERNEL_MODULES_OUT)/audio_usf.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_wcd.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_lpi.ko \
    $(KERNEL_MODULES_OUT)/audio_swr.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd_core.ko \
    $(KERNEL_MODULES_OUT)/audio_swr_ctrl.ko \
    $(KERNEL_MODULES_OUT)/audio_wsa881x.ko \
    $(KERNEL_MODULES_OUT)/audio_platform.ko \
    $(KERNEL_MODULES_OUT)/audio_hdmi.ko \
    $(KERNEL_MODULES_OUT)/audio_stub.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd9xxx.ko \
    $(KERNEL_MODULES_OUT)/audio_mbhc.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd938x.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd938x_slave.ko \
    $(KERNEL_MODULES_OUT)/audio_bolero_cdc.ko \
    $(KERNEL_MODULES_OUT)/audio_wsa_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_va_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_rx_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_tx_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_native.ko \
    $(KERNEL_MODULES_OUT)/audio_machine_kona.ko \
    $(KERNEL_MODULES_OUT)/audio_snd_event.ko \
    $(KERNEL_MODULES_OUT)/qca_cld3_wlan.ko \
    $(KERNEL_MODULES_OUT)/wil6210.ko \
    $(KERNEL_MODULES_OUT)/msm_11ad_proxy.ko \
    $(KERNEL_MODULES_OUT)/br_netfilter.ko \
    $(KERNEL_MODULES_OUT)/gspca_main.ko \
    $(KERNEL_MODULES_OUT)/lcd.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/mpq-adapter.ko \
    $(KERNEL_MODULES_OUT)/mpq-dmx-hw-plugin.ko \
    $(KERNEL_MODULES_OUT)/wigig_sensing.ko

TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#TARGET_USES_UNCOMPRESSED_KERNEL := false

BOARD_USES_GENERIC_AUDIO := true
#BOARD_QTI_CAMERA_32BIT_ONLY := true

#Disable appended dtb.
TARGET_KERNEL_APPEND_DTB := false
TARGET_COMPILE_WITH_MSM_KERNEL := true

#BOARD_INCLUDE_DTB_IN_BOOTIMG := false

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

ifeq ($(HOST_OS),linux)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_PIC := true
      ifneq ($(TARGET_BUILD_VARIANT),user)
        # Retain classes.dex in APK's for non-user builds
        DEX_PREOPT_DEFAULT := nostripping
      endif
    endif
endif

#Add non-hlos files to ota packages
ADD_RADIO_FILES := true

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# Enable sensor Version V_2
USE_SENSOR_HAL_VER := 2.0

#flag for qspm compilation
#TARGET_USES_QSPM := true

#-----------------------------------------------------------------
# wlan specific
#-----------------------------------------------------------------
#ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
#include device/qcom/wlan/kona/BoardConfigWlan.mk
#endif

SOURCE_ROOT := $(shell pwd)
TARGET_HOST_COMPILER_PREFIX_OVERRIDE := prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-
TARGET_HOST_CC_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)gcc
TARGET_HOST_CXX_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)g++
TARGET_HOST_AR_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)ar
TARGET_HOST_LD_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)ld

-include vendor/xiaomi/lmi/BoardConfigVendor.mk
