LOCAL_PATH:= $(call my-dir)

####### libtrace
include $(CLEAR_VARS)
LOCAL_MODULE := libltrace
LOCAL_LDLIBS := -lpthread -ldl
LOCAL_STATIC_LIBRARIES := libelf libcutils
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/ \
    $(LOCAL_PATH)/sysdeps/ \
    $(LOCAL_PATH)/sysdeps/linux-gnu \
    bionic/linker/ \
    external/elfutils/libelf/ \
    bionic/libc/private /
LOCAL_CFLAGS += -DPACKAGE_VERSION=\"0.7.3-greatfruit\" -Wno-pointer-arith
LOCAL_SRC_FILES := \
    breakpoints.c \
    debug.c \
    demangle.c \
    dict.c \
    ltrace-elf.c \
    execute_program.c \
    handle_event.c \
    libltrace.c \
    options.c \
    output.c \
    proc.c \
    read_config_file.c  \
    summary.c \
    library.c \
    filter.c \
    glob.c \
    type.c \
    value.c \
    value_dict.c \
    expr.c \
    fetch.c \
    vect.c \
    param.c \
    printf.c \
    zero.c \
    lens.c \
    lens_default.c \
    lens_enum.c \
    sysdeps/linux-gnu/events.c \
    sysdeps/linux-gnu/trace.c \
    sysdeps/linux-gnu/proc.c \
    sysdeps/linux-gnu/breakpoint.c \
    bionic-fixup/getline.c \
    bionic-fixup/rindex.c

ifeq ($(TARGET_ARCH),x86)
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/sysdeps/linux-gnu/x86/
    LOCAL_SRC_FILES += \
        sysdeps/linux-gnu/x86/plt.c \
        sysdeps/linux-gnu/x86/regs.c \
        sysdeps/linux-gnu/x86/trace.c \
        sysdeps/linux-gnu/x86/fetch.c
else
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/sysdeps/linux-gnu/arm/
    LOCAL_SRC_FILES += \
        sysdeps/linux-gnu/arm/breakpoint.c \
        sysdeps/linux-gnu/arm/plt.c \
        sysdeps/linux-gnu/arm/regs.c \
        sysdeps/linux-gnu/arm/trace.c
endif

include $(BUILD_STATIC_LIBRARY)


####### ltrace
include $(CLEAR_VARS)

LOCAL_MODULE := ltrace
LOCAL_STATIC_LIBRARIES := libltrace libelf libcutils
LOCAL_SRC_FILES := \
    main.c \
    bionic-fixup/dgettext.c \
    bionic-fixup/lsearch.c
include $(BUILD_EXECUTABLE)
