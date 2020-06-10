
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit vendor
$(call inherit-product, vendor/xiaomi/lmi/lmi-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
#PRODUCT_BUILD_VENDOR_IMAGE := true
PRODUCT_BUILD_PRODUCT_IMAGE := true

#PRODUCT_ENFORCE_RRO_TARGETS := *
#PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := false

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/bluetooth_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml
    
# Exclude sensor from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml \

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config \

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \

# Low power Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Device Settings
PRODUCT_PACKAGES += \
    DeviceSettings

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/devicesettings/privapp-permissions-devicesettings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-devicesettings.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-qti.xml

# Skip Mount
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/skip_mount.cfg:system/etc/init/config/skip_mount.cfg

# Common init scripts
PRODUCT_PACKAGES += \
	capture.sh \
    capture_headset.sh \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.mi.usb.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.fm.sh \
    init.qti.ims.sh \
    init.msm.usb.configfs.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    fstab.qcom \
    ueventd.qcom.rc \

PRODUCT_PACKAGES += \
	fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/hw/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom


# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy 

# For config.fs
PRODUCT_PACKAGES += \
    fs_config_files

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IPv6
PRODUCT_PACKAGES += \
    ethertypes \
    libebtc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf 

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    liba2dpoffload \
    libbthost_if \
	libbt-vendor \
	btconfig \
	libbt-hidlclient \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_falcon.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_falcon.bin \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_swl14.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_swl14.bin \
    $(LOCAL_PATH)/configs/wifi/fstman.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/fstman.ini \
    $(LOCAL_PATH)/configs/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wigig_p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_p2p_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wigig_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sysfs \
    vendor.lineage.livedisplay@2.0-service.xiaomi_lmi \
    vendor.lineage.livedisplay@2.0-service-sdm 

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.xiaomi_lmi

# QMI
PRODUCT_PACKAGES += \
    libjson

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.2 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

# Servicetracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.0.vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_lmi

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \
    $(LOCAL_PATH)/seccomp/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy
	
# WiFi Display
PRODUCT_PACKAGES += \
    libnl \

    #libdisplayconfig.vendor \
    libqdMetaData \
    libqdMetaData.system \
    libqdMetaData.vendor

PRODUCT_BOOT_JARS += \
    WfdCommon

# tri-state key
PRODUCT_PACKAGES += \
    KeyHandler \
    tri-state-key_daemon

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.supplicant@2.0.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    wifi-mac-generator \
    wpa_supplicant \
    wpa_supplicant.conf

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service \
	com.android.future.usb.accessory

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf \

#PRODUCT_PACKAGES += \
    #NotchNoFillOverlay

# Overlays -- Override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey

    #android.hardware.drm@1.2-service.widevine

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# CNE
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne \
    services-ext

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Media OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
	libplatformconfig \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libOmxCore \
    libOmxQcelp13Enc \
    libOmxVenc \
    libOmxVidcCommon \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxVdec \
    libstagefrighthw

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Boot control
PRODUCT_PACKAGES += \
	bootctrl.kona \
    android.hardware.boot@1.0-service.rc

# Update engine
#PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Cryptfshw
#PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0

# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++.vendor

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# Misc
PRODUCT_PACKAGES += \
    libchrome \
    libchrome.vendor

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service  \
    thermal.kona
 
# Audio
PRODUCT_PACKAGES += \
    libaacwrapper \
    android.hardware.audio@2.0-service \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.soundtrigger@2.2-impl:32 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.primary.kona \
    audio.usb.default \
    liba2dpoffload \
    libaudio-resampler \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
	libqahwwrapper \
	libqahw \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libtinycompress \
    libtinycompress.vendor \
    libvolumelistener \
    tinymix

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \
    vendor.qti.hardware.vibrator@1.2-service

#Camera
PRODUCT_PACKAGES +=  \
	android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-impl \
    libdng_sdk.vendor \
    Snap \
    android.hardware.camera.provider@2.4-service \
    camera.device@3.2-impl \
	camera.device@1.0-impl \
    vendor.qti.hardware.camera.device@1.0.vendor

# Camera Motor
PRODUCT_PACKAGES += \
    vendor.lineage.camera.motor@1.0-service.xiaomi_lmi

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    libdrm.vendor \
    libgui_vendor \
    libtinyxml \
    libvulkan \
    vendor.display.config@1.7 \
	android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.allocator@1.0-service \
    vendor.qti.hardware.display.allocator@1.0.vendor \
	libhistogram \
	libgpu_tonemapper \
	vendor.qti.hardware.display.composer-service \
	light.kona \
	libqservice \
	libsdedrm \
	libsdmcore \
	libsdmutils \
	keystore.kona \
    copybit \
    gralloc.kona \
    hdmi_cec.kona \
    hwcomposer.kona \
    memtrack.kona \
    libdisplayconfig \
    libgenlock \
    liboverlay \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.mapper@2.0-impl-qti-display 

# Display interfaces
PRODUCT_PACKAGES += \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.qti.hardware.display.allocator@1.0.vendor \
    vendor.qti.hardware.display.allocator@3.0.vendor \
    vendor.qti.hardware.display.composer@1.0.vendor \
    vendor.qti.hardware.display.composer@2.0.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor


# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Treble
PRODUCT_PACKAGES += \
    vndk-sp

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-impl \
    android.hardware.keymaster@4.0-service

# Filesystem tools
#PRODUCT_PACKAGES += \
    e2fsck_static \
    resize2fs_static

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Gesture handler
PRODUCT_PACKAGES += \
    GestureHandler

#crDroid Specific
#TARGET_HAS_FOD := true

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.xiaomi_lmi

PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# system prop for Bluetooth SOC type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.a2dp_offload.supported=false \
    persist.bluetooth.a2dp_offload.disabled=true \
    vendor.audio.feature.a2dp_offload.enable=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=false \
    ro.bluetooth.library_name=libbluetooth.so \
    vendor.qcom.bluetooth.soc=hastings \
    vendor.camera.aux.packagelist=org.lineageos.snap,net.sourceforge.opencamera,com.google.android.GoogleCamera \
	ro.sf.lcd_density=560

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

QCOM_BOARD_PLATFORMS += kona

#Default vendor image configuration
ENABLE_VENDOR_IMAGE := true

# Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# Boot control HAL test app
#PRODUCT_PACKAGES_DEBUG += bootctl

#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
		  libz \
		  libcutils


# QRTR related packages
PRODUCT_PACKAGES += qrtr-ns \
			qrtr-lookup \
			libqrtr 

# Context hub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# f2fs utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Userdata checkpoint
PRODUCT_PACKAGES += \
    checkpoint_gc

# Kernel modules install path
#KERNEL_MODULES_INSTALL := dlkm
#KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules
#AUDIO_FEATURE_ENABLED_DLKM := true

# FaceAuth feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.biometrics.face.xml \

#ANT+ stack
PRODUCT_PACKAGES += \
    libvolumelistener

# Vendor property to enable advanced network scanning
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.enableadvancedscan=true

#Product property overrides to configure the Dalvik heap
PRODUCT_PROPERTY_OVERRIDES  += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
	ro.board.platform=kona

# Framework detect
PRODUCT_PACKAGES += \
	liboemaids_system	\
	liboemaids_vendor \
	libus \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# ATRACE_HAL
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := msm8974 msm8610 msm8226 apq8084 msm8916 msm8994 msm8909 msm8992 msm8996 msm8952 msm8937 msm8953 msm8998 apq8098_latv sdm660 sdm845 sdm710 qcs605 msmnile $(MSMSTEPPE) $(TRINKET) kona atoll lito

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996 msm8998 sdm660 sdm845 apq8098_latv sdm710 qcs605 msmnile $(MSMSTEPPE) $(TRINKET) kona lito atoll bengal

ifeq ($(strip $(OTA_FLAG_FOR_DRM)),true)
PRODUCT_PACKAGES += move_widevine_data.sh
endif
PRODUCT_PACKAGES += move_wifi_data.sh
PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += libion

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# include additional build utilities
#-include device/qcom/common/utils.mk

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
    ro.adb.secure=1
endif

#Enable full treble flag
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

#----------------------------------------------------------------------
# wlan specific
#----------------------------------------------------------------------
#include device/qcom/wlan/msmnile/wlan.mk

#PRODUCT_PROPERTY_OVERRIDES += \
	ro.crypto.volume.filenames_mode = "aes-256-cts" \
	ro.crypto.allow_encrypt_override = true

#PRODUCT_PACKAGES += blank_screen \
		  bootanimation \
		  libgui \
		  libpixelflinger \
		  libsurfaceflinger \
		  libsurfaceflinger_ddmconnection \
		  libui \
		  surfaceflinger \
		  appwidget \
		  android.test.base \
		  android.test.mock \
		  android.test.runner \
		  audioserver \
		  app_process \
		  cameraserver \
		  com.android.location.provider \
		  ContactsProvider \
		  DefaultContainerService \
		  DownloadProvider \
		  ExtServices \
		  ExtShared \
		  ims-common \
		  libaaudio \
		  libamidi \
		  libandroid \
		  libandroidfw \
		  libandroid_runtime \
		  libandroid_servers \
		  libaudioeffect_jni \
		  libaudioflinger \
		  libaudiopolicymanager \
		  libaudiopolicyservice \
		  libaudioutils \
		  libcamera2ndk \
		  libcamera_client \
		  libcameraservice \
		  libdrmframework \
		  libdrmframework_jni \
		  libEGL \
		  libETC1 \
		  libFFTEm \
		  libGLESv1_CM \
		  libGLESv2 \
		  libGLESv3 \
		  libmedia \
		  libmedia_jni \
		  libmediandk \
		  libmediaplayerservice \
		  libsoundpool \
		  libsoundtrigger \
		  libsoundtriggerservice \
		  libstagefright \
		  libstagefright_amrnb_common \
		  libstagefright_enc_common \
		  libstagefright_foundation \
		  libstagefright_omx \
		  libwifi-service \
		  media \
		  media_cmd \
		  mediadrmserver \
		  mediaextractor \
		  mediametrics \
		  MediaProvider \
		  mediaserver \
		  PackageInstaller \
		  PermissionController \
		  SettingsProvider \
		  telecom \
		  telephony-common \
		  voip-common \
		  WallpaperBackup \
		  wificond \
		  wifi-service \
		  wm

# Codec2 modules
#PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager

# Insmod files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

# Touchscreen
PRODUCT_PACKAGES += \
    libtinyxml2

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk_package

# GPS
PRODUCT_PACKAGES += \
    libbatching \
    libgeofencing \
    libgnss \

    #libgnsspps

PRODUCT_PACKAGES += \
    android.hardware.gnss@2.0-impl-qti \
    android.hardware.gnss@2.0-service-qti

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# VR
PRODUCT_PACKAGES += \
    android.hardware.vr@1.0-impl \
    android.hardware.vr@1.0-service \
    vr.kona
