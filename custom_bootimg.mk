TARGET_RECOVERY_COMPRESSED_GZIP := $(PRODUCT_OUT)/mtk_recovery.cpio.gz
TARGET_RAMDISK_COMPRESSED_GZIP := $(PRODUCT_OUT)/mtk_ramdisk.cpio.gz

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo "----- Making recovery image ------"
	#Add the sec.ko module to root and rebuild ramdisk
	cp $(PRODUCT_OUT)/$(KERNEL_MODULES_INSTALL)/lib/modules/sec.ko $(TARGET_RECOVERY_ROOT_OUT)
	$(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $(recovery_uncompressed_ramdisk)
	$(MINIGZIP) < $(recovery_uncompressed_ramdisk) > $(recovery_ramdisk)
	$(LOCAL_FOLDER)/tools/mtk_pack --recovery $(recovery_ramdisk) $(PRODUCT_OUT) -o $(TARGET_RECOVERY_COMPRESSED_GZIP)
	$(LOCAL_FOLDER)/tools/mkbootimg --kernel $(recovery_kernel) --ramdisk $(TARGET_RECOVERY_COMPRESSED_GZIP) --pagesize $(BOARD_KERNEL_PAGESIZE)  --output $@
	@echo -e ${CL_INS}"Made recovery image: $@"${CL_RST}
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	#Force unsecure mode
	sed -i 's/ro.adb.secure=1/ro.adb.secure=0/g' $(TARGET_ROOT_OUT)/default.prop
	$(MKBOOTFS) $(TARGET_ROOT_OUT) | $(MINIGZIP) > $(INSTALLED_RAMDISK_TARGET)
	$(LOCAL_FOLDER)/tools/mtk_pack --rootfs $(INSTALLED_RAMDISK_TARGET) -o $(TARGET_RAMDISK_COMPRESSED_GZIP)
	#$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(LOCAL_FOLDER)/tools/mkbootimg --kernel $(INSTALLED_KERNEL_TARGET) --ramdisk $(TARGET_RAMDISK_COMPRESSED_GZIP) --pagesize $(BOARD_KERNEL_PAGESIZE)  --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}


