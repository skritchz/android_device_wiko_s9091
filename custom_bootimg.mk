TARGET_RECOVERY_COMPRESSED_GZIP := $(PRODUCT_OUT)/mtk_recovery.cpio.gz

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo "----- Making recovery image ------"
	cp $(PRODUCT_OUT)/$(KERNEL_MODULES_INSTALL)/lib/modules/sec.ko $(TARGET_RECOVERY_ROOT_OUT)
	$(LOCAL_FOLDER)/tools/mtk_pack --recovery $(TARGET_RECOVERY_ROOT_OUT) $(PRODUCT_OUT) -o $(TARGET_RECOVERY_COMPRESSED_GZIP)
	$(LOCAL_FOLDER)/tools/mkbootimg --kernel $(recovery_kernel) --ramdisk $(TARGET_RECOVERY_COMPRESSED_GZIP) --pagesize $(BOARD_KERNEL_PAGESIZE)  --output $@
	@echo -e ${CL_INS}"Made recovery image: $@"${CL_RST}
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

#TODO This will have to be changed to correct MEDIATEK expected format.
#For now just build kernel
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}


