SOURCEDIR = src
BUILDDIR = build

EXECUTABLE = bonfire_simulator
SOURCES = $(wildcard $(SOURCEDIR)/*.cpp)
OBJECTS = $(patsubst $(SOURCEDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

CC = gcc
CFLAGS = -Wall -O -g -std=c++11
OBJS = main.o memory.o

LD = ld

RM = rm -rf


all: mlite_simulator bonfire_sim

mlite_simulator:
	@$(CC) -o mlite_simulator $(SRC_DIR)/mlite_simulator.c

bonfire_sim: dir $(BUILDDIR)/$(EXECUTABLE)

dir:
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/$(EXECUTABLE): $(OBJECTS)
	$(CC) $^ -o $@ -lstdc++

$(OBJECTS): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.cpp
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	-$(RM) mlite_simulator $(BUILDDIR)
