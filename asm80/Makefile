# Makefile for asm80 - Intel 8080 Assembler
# Copyright (C) 2020 Mark Ogden

# Compiler settings
CC = gcc
CFLAGS = -Wall -O2 -I.
TARGET = asm80

# Source files
SOURCES = asm1m.c asm2m.c asm3m.c asm4m.c asm5m.c asm6m.c asm8m.c \
          asxref.c cntrlm.c debug.c emitm.c globlm.c initm.c \
          io.c keym.c listm.c pcktok.c rdsrc.c startm.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = asm80.h data.h error.h literals.h plm80types.h procs.h Generated/version.h

# Default target
all: $(TARGET)

# Main executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Object file compilation
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Generate version header
Generated/version.h: version.in
	@mkdir -p Generated
	cp version.in Generated/version.h

# Clean build files
clean:
	rm -f $(OBJECTS) $(TARGET)
	rm -rf Generated/

# Clean and rebuild
rebuild: clean all

# Install (optional - adjust path as needed)
install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin/

# Uninstall
uninstall:
	rm -f /usr/local/bin/$(TARGET)

# Show help
help:
	@echo "Available targets:"
	@echo "  all       - Build the asm80 executable (default)"
	@echo "  clean     - Remove build files"
	@echo "  rebuild   - Clean and rebuild"
	@echo "  install   - Install to /usr/local/bin"
	@echo "  uninstall - Remove from /usr/local/bin"
	@echo "  help      - Show this help"

# Test the build
test: $(TARGET)
	./$(TARGET) -v

# Phony targets
.PHONY: all clean rebuild install uninstall help test

# Dependencies
$(OBJECTS): $(HEADERS)