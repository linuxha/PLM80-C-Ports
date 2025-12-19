# Makefile for locate - Intel Locater/Linker utility
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O2 -I.
LDFLAGS = 

# Target executable
TARGET = locate

# Source files
SOURCES = loc1.c loc2a.c loc2b.c loc3.c loc4.c loc4a.c loc5a.c loc5b.c \
          loc6.c loc7.c loc8.c loc8a.c loc9.c io.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = loc.h error.h

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compile source files to object files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Debug build
debug: CFLAGS += -g -DDEBUG -O0
debug: $(TARGET)

# Release build
release: CFLAGS += -DNDEBUG
release: $(TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all generated files
distclean: clean
	rm -f *~ core

# Install target
install: $(TARGET)
	install -d $(DESTDIR)/usr/local/bin
	install -m 755 $(TARGET) $(DESTDIR)/usr/local/bin/

# Uninstall target
uninstall:
	rm -f $(DESTDIR)/usr/local/bin/$(TARGET)

.PHONY: all clean distclean debug release install uninstall