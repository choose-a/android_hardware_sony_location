LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libloc_ds_api
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog \
    libgps.utils

LOCAL_SRC_FILES += \
    ds_client.c

LOCAL_CFLAGS += \
    -fno-short-enums \
    -D_ANDROID_

LOCAL_COPY_HEADERS_TO:= libloc_ds_api/

LOCAL_COPY_HEADERS:= \
    ds_client.h

LOCAL_LDFLAGS += -Wl,--export-dynamic

## Includes
LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/data/inc

ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers \
    libloc_pla_headers
LOCAL_CFLAGS += $(GNSS_CFLAGS)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc_ds_api_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)
