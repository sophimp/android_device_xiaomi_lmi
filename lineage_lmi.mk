# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from lmi device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := lmi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := lineage_lmi
PRODUCT_MODEL := Lmi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR := xiaomi
TARGET_VENDOR_PRODUCT_NAME := lmi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_CHARACTERISTICS := nosdcard

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Redmi/lmi/lmi:10/QKQ1.191117.002/V11.0.16.0.QJKCNXM:user/release-keys

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=lmi \
    PRODUCT_NAME=lmi \
	PRIVATE_BUILD_DESC="qssi-user 10 QKQ1.191117.002 V11.0.16.0.QJKCNXM release-keys"
