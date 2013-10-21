LOCAL_PATH:= $(call my-dir)

####### libtrace
include $(CLEAR_VARS)
LOCAL_MODULE := libltrace
LOCAL_LDLIBS := -lpthread -ldl
LOCAL_STATIC_LIBRARIES := libelf libos
LOCAL_C_INCLUDES  += bionic/linker/ external/elfutils/libelf/
LOCAL_CFLAG += -DHAVE_LIBIBERTY
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
    lens_enum.c
include $(BUILD_SHARED_LIBRARY)


####### ltrace
include $(CLEAR_VARS)

LOCAL_MODULE := ltrace
LOCAL_STATIC_LIBRARIES += libtrace
LOCAL_SRC_FILES := main.c
include $(BUILD_EXECUTABLE)
