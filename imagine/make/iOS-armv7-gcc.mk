include $(dir $(abspath $(lastword $(MAKEFILE_LIST))))config.mk
include $(currPath)/iOS-gcc.mk

ifndef targetSuffix
 targetSuffix := -armv7
endif

# ARMv7 with LTO needs at least iOS 4.3
minIOSVer := 4.3
CHOST := arm-apple-darwin11
IOS_FLAGS += -arch armv7
ifdef ios_armv7State # default is -mthumb by compiler if not defined
 IOS_FLAGS += $(ios_armv7State)
endif
ASMFLAGS += -arch armv7
system_externalSysroot := $(IMAGINE_PATH)/bundle/darwin-iOS/armv7
CPPFLAGS += -I$(system_externalSysroot)/include
LDLIBS += -L$(system_externalSysroot)/lib