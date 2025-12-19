# Makefile for lib - Intel PL/M Library utilities
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O2 -I.
LDFLAGS = 

# Target executable
TARGET = lib

# Source files
SOURCES = lib.c lib1.c lib3.c lib4.c io.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = lib.h error.h Generated/version.h

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Generate version header
Generated/version.h: version.in
	@mkdir -p Generated
	cp version.in Generated/version.h

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
	rm -rf Generated/

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