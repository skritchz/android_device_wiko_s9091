# Default config:
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/wiko/s9091/s9091-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/wiko/s9091/overlay

PRODUCT_AAPT_CONFIG := normal hdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_s9091
PRODUCT_DEVICE := s9091

#Permissions dump from device
PRODUCT_COPY_FILES += \
	device/wiko/s9091/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml\
	device/wiko/s9091/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml\
	device/wiko/s9091/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml\
	device/wiko/s9091/permissions/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml\
	device/wiko/s9091/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml\
	device/wiko/s9091/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml\
	device/wiko/s9091/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml\
	device/wiko/s9091/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml\
	device/wiko/s9091/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml\
	device/wiko/s9091/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml\
	device/wiko/s9091/permissions/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml\
	device/wiko/s9091/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml\
	device/wiko/s9091/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml\
	device/wiko/s9091/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml\
	device/wiko/s9091/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml\
	device/wiko/s9091/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml\
	device/wiko/s9091/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml\
	device/wiko/s9091/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml\
	device/wiko/s9091/permissions/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml\
	device/wiko/s9091/permissions/android.software.sip.xml:system/etc/permissions/android.software.sip.xml\
	device/wiko/s9091/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml\
	device/wiko/s9091/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml\
	device/wiko/s9091/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml\
	device/wiko/s9091/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml\
	device/wiko/s9091/permissions/com.mediatek.location.provider.xml:system/etc/permissions/com.mediatek.location.provider.xml\
	device/wiko/s9091/permissions/features.xml:system/etc/permissions/features.xml\
	device/wiko/s9091/permissions/gpsconfig.xml:system/etc/permissions/gpsconfig.xml\
	device/wiko/s9091/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml\
	device/wiko/s9091/permissions/platform.xml:system/etc/permissions/platform.xml\
	

PRODUCT_COPY_FILES += \
    device/wiko/s9091/prebuilt/root/init.s9091.rc:root/init.s9091.rc \
    device/wiko/s9091/prebuilt/root/init.s9091.usb.rc:root/init.s9091.usb.rc \
    device/wiko/s9091/prebuilt/root/ueventd.s9091.rc:root/ueventd.s9091.rc \
    device/wiko/s9091/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/wiko/s9091/prebuilt/system/usr/keylayout/s9091_keypad.kl:/system/usr/keylayout/s9091_keypad.kl\
    device/wiko/s9091/prebuilt/system/etc/.tp/thermal.conf:/system/etc/.tp/thermal.conf\
    device/wiko/s9091/prebuitl/system/etc/.tp/thermal.off.conf:/system/etc/.tp/thermal.off.conf \
    device/wiko/s9091/prebuilt/system/etc/mpeg4_venc_parameter.cfg:/system/etc/mpeg4_venc_parameter.cfg \
    device/wiko/s9091/prebuilt/system/etc/mtk_omx_core.cfg:/system/etc/mtk_omx_core.cfg \
    device/wiko/s9091/prebuilt/system/etc/player.cfg:/system/etc/player.cfg \
    device/wiko/s9091/prebuilt/system/etc/srs_processing.cfg:/system/etc/srs_processing.cfg
