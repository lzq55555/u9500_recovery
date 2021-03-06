$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/u9500/u9500-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u9500/overlay

LOCAL_PATH := device/huawei/u9500
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_u9500
PRODUCT_DEVICE := u9500

# Files needed for recovery image
PRODUCT_COPY_FILES += \
  device/huawei/U9500/recovery/sbin/chargeservice:/recovery/root/sbin/chargeservice \
  device/huawei/U9500/recovery/720x1280/:/recovery/root/res/images/720x1280/