#
# Copyright (C) 2017 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#


# Common specific options in device_w55ds.mk
-include device/lge/msm8226-common/BoardConfigCommon.mk

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
TARGET_BOARD_PLATFORM := msm8610

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8610

# Kernel
TARGET_KERNEL_CONFIG := w55ds_lineageos_defconfig

# Filesystem,
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=   1100000000
BOARD_CACHEIMAGE_PARTITION_SIZE :=    100000000
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432

# twrp
ifneq ($(WITH_TWRP),)
	BOARD_HAS_FLIPPED_SCREEN := true
	BOARD_HAS_NO_SELECT_BUTTON := true
	BOARD_SUPPRESS_SECURE_ERASE := true
	TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
	TW_DEFAULT_EXTERNAL_STORAGE := true
	TW_EXTERNAL_STORAGE_PATH := "/sdcard"
	TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
	TW_FLASH_FROM_STORAGE := true
	TW_INCLUDE_CRYPTO := true
	TW_INTERNAL_STORAGE_PATH := "/data/media"
	TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
	TW_NO_REBOOT_BOOTLOADER := true
	TW_THEME := portrait_mdpi
	TARGET_RECOVERY_FSTAB := device/lge/w55ds/rootdir/twrp.fstab
	TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
	TARGET_RECOVERY_QCOM_RTC_FIX := true
	TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
	TARGET_USERIMAGES_USE_EXT4 := true
	TARGET_USERIMAGES_USE_F2FS := true

	# Include parted in twrp
	TARGET_RECOVERY_DEVICE_MODULES := parted
	RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/parted
endif
