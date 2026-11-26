LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := libprotobuf_stub_cne
LOCAL_SRC_FILES := ../../proprietary/vendor/lib64/libprotobuf_stub_cne.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)
