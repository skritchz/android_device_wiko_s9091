# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/wiko/s9091/BoardConfigVendor.mk


LOCAL_FOLDER := device/wiko/s9091

PREBUILT_FOLDER := $(LOCAL_FOLDER)/prebuilt


#We should use the current kernel until we can provide some more information when build
#TARGET_PREBUILT_KERNEL := $(PREBUILT_FOLDER)/kernel
TARGET_KERNEL_SOURCE := kernel/wiko/s9091/kernel
TARGET_KERNEL_CONFIG := mediatek-configs
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-linux-androideabi-4.4.x
TARGET_KERNEL_CUSTOM_TOOLCHAIN_BIN := arm-linux-androideabi-
TARGET_KERNEL_PROVIDES_BUILD_COMMANDS := kernel/wiko/s9091/s9091.mk
NEEDS_KERNEL_COPY := true

#we need special init.rc because of the sec.ko module to be loaded
TARGET_RECOVERY_INITRC := $(LOCAL_FOLDER)/recovery/init.rc

KERNEL_MAKE_PARAMETERS := TARGET_PRODUCT=tinno77_ics2 MTK_ROOT_CUSTOM=$(TARGET_KERNEL_SOURCE)/mediatek/custom 

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_FOLDER)/include

TARGET_BOARD_PLATFORM := mt6577

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_NEON := true

#STUFF I KNOW
#We need to use mediatek RIL libs
#We will have to provide a wrapper around the default mtril
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true
BOARD_NO_REFERENCE_RIL := true
BOARD_NO_MOCK_RIL := true

#STUFF NOT SURE AT ALL
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_USES_GENERIC_AUDIO := false

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX531

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp


BOARD_CONFIG_DIR := $(LOCAL_FOLDER)/config

#Graphics
BOARD_EGL_CFG := $(BOARD_CONFIG_DIR)/egl.cfg
USE_OPENGL_RENDERER := true

#Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true


# TARGET_BOARD_PLATFORM := unknown
TARGET_BOOTLOADER_BOARD_NAME := s9091


BOARD_DISABLE_FMRADIO_TRANSMITTER_TEST := true

### TODO AND TO CHECK
BOARD_KERNEL_CMDLINE := 
# Checked in sysinfo
BOARD_KERNEL_PAGESIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096

#TODO check the recovery this doesn't exist in the original stuff
BOARD_BOOTIMAGE_PARTITION_SIZE := 6500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6000000

#This is provided by the wiko sources. Some info are not used in CM9 real definitions
#5*1024*1024
BOARD_SECROIMAGE_PARTITION_SIZE:=5242880
#499*1024*1024
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=523239424
BOARD_CACHEIMAGE_PARTITION_SIZE:=523239424
#1038*1024*1024
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1088421888
BOARD_FATIMAGE_PARTITION_SIZE:=0


BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_FOLDER)/custom_bootimg.mk


#TODO CHECK
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_ARMV7A_BUG := true

#WIFI STUFF FROM Wiko configuration file
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_P2P_SUPPLICANT_DRIVER := NL80211
HAVE_CUSTOM_WIFI_DRIVER_2 := true
HAVE_INTERNAL_WPA_SUPPLICANT_CONF := true
HAVE_CUSTOM_WIFI_HAL := mediatek
WPA_SUPPLICANT_VERSION := VER_0_6_X
P2P_SUPPLICANT_VERSION := VER_0_8_X

#define board stuff
BOARD_NAND_PAGE_SIZE := 4096 -s 128


#SOME OTHER STUFF TO ADD
# Sensors
#SOMC_CFG_DASH_INCLUDED := yes
SENSORS_COMPASS_AK8973 := true
SENSORS_ACCEL_BMA150_INPUT := true
SENSORS_ACCEL_BMA250_INPUT := false
SENSORS_PROXIMITY_APDS9120 := true
SENSORS_PRESSURE_BMP180 := false

#Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CUSTOM_HCIATTACH := true


