# Copyright (C) 2009 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

TARGET_MSM8974_COMMON_WLAN_VARIANT := prima

-include device/samsung/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/lt03lte/include


TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel Configs
TARGET_KERNEL_SOURCE := kernel/samsung/lt03lte
TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8974_sec_lt03eur_defconfig

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/lt03lte/mkbootimg.mk

# INSTALLED_DTIMAGE_TARGET := device/samsung/lt03lte/prebuilt/dtb
# TARGET_PREBUILT_KERNEL := device/samsung/lt03lte/prebuilt/zImage

# Graphics
BOARD_EGL_CFG := device/samsung/lt03lte/egl.cfg

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/samsung/lt03lte/rootdir/etc/fstab.qcom
BOARD_RECOVERY_SWIPE := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12828261888
BOARD_FLASH_BLOCK_SIZE := 131072

# WLAN: Use qmi-client interface to load the correct MAC address
TARGET_USES_QCOM_WCNSS_QMI := true

# Samsung's nonstandard csd-client
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# Audio settings
BOARD_USES_CUSTOM_AUDIO_PLATFORM_PATH := device/samsung/lt03lte/audio/platform
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
#AUDIO_FEATURE_DISABLED_SSR := true
#AUDIO_FEATURE_DISABLED_INCALL_MUSIC := true
#AUDIO_FEATURE_DISABLED_SPKR_PROTECTION := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# Build lights
TARGET_PROVIDES_LIBLIGHT := true

# IR
TARGET_PROVIDES_CONSUMERIR_HAL := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Display
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024


# PowerHAL
#TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/lt03lte/power/power_ext.c

# The "new" GPS is really the old GPS, override it.
BOARD_HAVE_NEW_QC_GPS :=

# We don't use old-ass RPC
TARGET_NO_RPC := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/lt03lte/init/init_lt03lte.c

# Assert
TARGET_OTA_ASSERT_DEVICE := lt03lte,lt03ltexx