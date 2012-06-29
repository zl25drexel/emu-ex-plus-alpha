ifndef inc_pkg_unzip
inc_pkg_unzip := 1

ifdef package_unzip_externalPath
	CPPFLAGS += -I$(package_unzip_externalPath)/include
	LDLIBS += $(package_unzip_externalPath)/lib/unzip.o $(package_unzip_externalPath)/lib/ioapi.o $(package_unzip_externalPath)/lib/zip.o
else
	ifeq ($(ENV), macOSX)
		LDLIBS += $(IMAGINE_PATH)/bundle/macosx-x86/usr/lib/unzip.o $(IMAGINE_PATH)/bundle/macosx-x86/usr/lib/ioapi.o $(IMAGINE_PATH)/bundle/macosx-x86/usr/lib/zip.o
	else
		OBJ += $(system_externalSysroot)/lib/unzip.o $(system_externalSysroot)/lib/ioapi.o $(system_externalSysroot)/lib/zip.o
	endif
endif

LDLIBS += -lz

endif

$(system_externalSysroot)/lib/%.o: $(system_externalSysroot)/../../all/src/unzip/%.c
	@echo "Compiling $<"
	@mkdir -p $(@D)
	$(PRINT_CMD)$(CC) $(compileAction) $< $(CPPFLAGS) $(CFLAGS) -I$(system_externalSysroot)/../../../../NEO.emu/src/gngeo/ -I$(system_externalSysroot)/../../../../NEO.emu/src/ -o $@
