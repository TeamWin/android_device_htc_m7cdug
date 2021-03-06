LOCAL_PATH := $(call my-dir)

define _add-offmode_charging-image
include $$(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_$(notdir $(1))
LOCAL_MODULE_STEM := $(notdir $(1))
_img_modules += $$(LOCAL_MODULE)
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_RECOVERY_ROOT_OUT)/res/offmode_charging_images
include $$(BUILD_PREBUILT)
endef

_img_modules :=
$(foreach _img, $(call find-subdir-subdir-files, "res/offmode_charging_images", "*.png"), \
  $(eval $(call _add-offmode_charging-image,$(_img))))

include $(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_res_images
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(_img_modules)
include $(BUILD_PHONY_PACKAGE)

define _add-offmode_charging_warn-image
include $$(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_warn_$(notdir $(1))
LOCAL_MODULE_STEM := $(notdir $(1))
_img_modules += $$(LOCAL_MODULE)
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_RECOVERY_ROOT_OUT)/res/offmode_charging_warn_images
include $$(BUILD_PREBUILT)
endef

_img_modules :=
$(foreach _img, $(call find-subdir-subdir-files, "res/offmode_charging_warn_images", "*.png"), \
  $(eval $(call _add-offmode_charging_warn-image,$(_img))))

include $(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_warn_res_images
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(_img_modules)
include $(BUILD_PHONY_PACKAGE)

_add-offmode_charging-image :=
_add-offmode_charging_warn-image :=
_img_modules :=
