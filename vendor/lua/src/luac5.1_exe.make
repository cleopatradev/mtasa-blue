# C Console Executable Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=Debug
endif

ifeq ($(CONFIG),Debug)
  BINDIR := ../bin
  LIBDIR := ../lib
  OBJDIR := ../obj/luac5.4_exe/Debug
  OUTDIR := ../bin
  CPPFLAGS := -MD -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE -I "../include" -I "../src"
  CFLAGS += $(CPPFLAGS) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -Wl,-E -L"../lib" -llua5.4 -lm -ldl
  LDDEPS :=
  TARGET := luac5.4
  BLDCMD = $(CC) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES)
endif

ifeq ($(CONFIG),Release)
  BINDIR := ../bin
  LIBDIR := ../lib
  OBJDIR := ../obj/luac5.4_exe/Release
  OUTDIR := ../bin
  CPPFLAGS := -MD -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE -I "../include" -I "../src"
  CFLAGS += $(CPPFLAGS) -O2
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -Wl,-E -L"../lib" -llua5.4 -lm -ldl
  LDDEPS :=
  TARGET := luac5.4
  BLDCMD = $(CC) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES)
endif

OBJECTS := \
	$(OBJDIR)/luac.o \
	$(OBJDIR)/print.o \

CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking luac5.4_exe
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning luac5.4_exe
	-@rm -rf $(OUTDIR)/$(TARGET) $(OBJDIR)

$(OBJDIR)/luac.o: luac.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR)/print.o: print.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)

