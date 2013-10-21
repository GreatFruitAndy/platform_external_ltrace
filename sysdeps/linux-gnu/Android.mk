LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libos
LOCAL_LDLIBS := -lpthread -ldl
LOCAL_C_INCLUDES += external/elfutils/libelf/
LOCAL_SRC_FILES := \
    events.c \
    trace.c \
    proc.c \
    breakpoint.c

ifeq ($(TARGET_ARCH),x86)
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/x86/
    LOCAL_SRC_FILES += \
        $(LOCAL_PATH)/x86/plt.c \
        $(LOCAL_PATH)/x86/regs.c \
        $(LOCAL_PATH)/x86/trace.c \
        $(LOCAL_PATH)/x86/fetch.c
else
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/arm/
    LOCAL_SRC_FILES += \
        $(LOCAL_PATH)/arm/breakpoint.c \
        $(LOCAL_PATH)/arm/plt.c \
        $(LOCAL_PATH)/arm/regs.c \
        $(LOCAL_PATH)/arm/trace.c
endif

include $(BUILD_STATIC_LIBRARY)
