# Program name
PROG_NAME = bonfire_simulator

# Directories
BONFIRE_ROOT = ../..

SOURCEDIR 	    = src
CORE_FILES	    = $(SOURCEDIR)/core
PLASMA_FILES	= $(SOURCEDIR)/plasma
TEXT_UI_FILES	= $(SOURCEDIR)/text_ui

INCLUDE_DIRS  = -I $(SOURCEDIR)
INCLUDE_DIRS += -I $(CORE_FILES)
INCLUDE_DIRS += -I $(PLASMA_FILES)
INCLUDE_DIRS += -I $(TEXT_UI_FILES)

BUILDDIR	= $(BONFIRE_ROOT)/tmp/bin/$(PROG_NAME)

# Compiler flags
CFLAGS = -Wall -O -g -std=c++11 -pthread

# Linker flags
LDFLAGS = -lstdc++
# Toolchain commands
CC 	 = gcc
LD 	 = ld

# System Commands
RM = rm -rf

# Program sources
PROG_SOURCES	        = $(wildcard $(SOURCEDIR)/*.cpp)
PROG_CORE_SOURCES	    = $(wildcard $(CORE_FILES)/*.cpp)
PROG_PLASMA_SOURCES	    = $(wildcard $(PLASMA_FILES)/*.cpp)
PROG_TEXT_UI_SOURCES	= $(wildcard $(TEXT_UI_FILES)/*.cpp)

# Object files
OBJECTS_ROOT	  = $(patsubst $(SOURCEDIR)/%.cpp,$(BUILDDIR)/%.o,$(PROG_SOURCES))
OBJECTS_CORE	  = $(patsubst $(CORE_FILES)/%.cpp,$(BUILDDIR)/%.o,$(PROG_CORE_SOURCES))
OBJECTS_PLASMA	  = $(patsubst $(PLASMA_FILES)/%.cpp,$(BUILDDIR)/%.o,$(PROG_PLASMA_SOURCES))
OBJECTS_TEXT_UI	  = $(patsubst $(TEXT_UI_FILES)/%.cpp,$(BUILDDIR)/%.o,$(PROG_TEXT_UI_SOURCES))


# Rules
PHONY: all

all: dir $(BUILDDIR)/$(PROG_NAME)

# Create a directory
dir:
	mkdir -p $(BUILDDIR)

# Build the executable
$(BUILDDIR)/$(PROG_NAME): $(OBJECTS_ROOT) $(OBJECTS_CORE) $(OBJECTS_PLASMA) $(OBJECTS_TEXT_UI)
	$(CC) $(CFLAGS) $^ -o $@ -lstdc++

# Build files in src root
$(OBJECTS_ROOT): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE_DIRS) $< -o $@

# Build core files
$(OBJECTS_CORE): $(BUILDDIR)/%.o : $(CORE_FILES)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE_DIRS) $< -o $@

# Build Plasma files
$(OBJECTS_PLASMA): $(BUILDDIR)/%.o : $(PLASMA_FILES)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE_DIRS) $< -o $@

# Build text UI files
$(OBJECTS_TEXT_UI): $(BUILDDIR)/%.o : $(TEXT_UI_FILES)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE_DIRS) $< -o $@

run:
	$(BUILDDIR)/$(PROG_NAME)

clean:
	-$(RM) $(BUILDDIR)
