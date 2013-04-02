# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

$(call inherit-product, device/wiko/s9091/s9091.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := s9091
PRODUCT_NAME := cm_s9091
PRODUCT_BRAND := wiko
PRODUCT_MODEL := s9091
PRODUCT_MANUFACTURER := wiko
