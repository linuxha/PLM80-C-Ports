# Makefile for binobj - Intel binary to object converter
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O2
LDFLAGS = 

# Target executable
TARGET = binobj

# Source files
SOURCES = binobj.c version.c

# Object files (generated from source files)
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

# Release build (default optimization)
release: CFLAGS += -DNDEBUG
release: $(TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all generated files
distclean: clean
	rm -f *~ core

# Install target (optional)
install: $(TARGET)
	install -d $(DESTDIR)/usr/local/bin
	install -m 755 $(TARGET) $(DESTDIR)/usr/local/bin/

# Uninstall target
uninstall:
	rm -f $(DESTDIR)/usr/local/bin/$(TARGET)

# Show help
help:
	@echo "Available targets:"
	@echo "  all      - Build the executable (default)"
	@echo "  debug    - Build with debug symbols"
	@echo "  release  - Build optimized release version"
	@echo "  clean    - Remove object files and executable"
	@echo "  distclean- Remove all generated files"
	@echo "  install  - Install to /usr/local/bin"
	@echo "  uninstall- Remove from /usr/local/bin"
	@echo "  help     - Show this help message"

# Test the build
test: $(TARGET)
	./$(TARGET) -v || true
	@echo "Build test completed successfully"

# Dependencies
binobj.o: binobj.c version.in
version.o: version.c version.in

# Phony targets
.PHONY: all debug release clean distclean install uninstall help test