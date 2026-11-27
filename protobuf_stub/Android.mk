LOCAL_PATH := $(call my-dir)

# Build the stub for the target (arm64). The old prebuilt was x86_64,
# so every process that LD_PRELOADs it (cnd, netmgrd, rild) failed to link.
include $(CLEAR_VARS)
LOCAL_MODULE := libprotobuf_stub_cne
LOCAL_SRC_FILES := protobuf_stub.cpp
LOCAL_MULTILIB := 64
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
