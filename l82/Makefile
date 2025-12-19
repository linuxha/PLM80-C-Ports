# Makefile for l82 - Intel 8080 Linker L82
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O2 -I.
LDFLAGS = 

# Target executable
TARGET = l82

# Source files
SOURCES = l82.c gram.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compile source files to object files
%.o: %.c
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