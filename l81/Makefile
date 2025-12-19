# Makefile for l81 - High Level Assembler Lexical & Parser
# Copyright (C) 2020 Mark Ogden <mark.pm.ogden@btinternet.com>

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2 -std=c99
DEBUG_CFLAGS = -Wall -Wextra -g -O0 -std=c99 -D_DEBUG

# Target executable
TARGET = l81

# Source files
SOURCES = l81.c l81tab.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header dependencies
HEADERS = version.in

# Default target
all: $(TARGET)

# Debug target
debug: CFLAGS = $(DEBUG_CFLAGS)
debug: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

# Compile source files to object files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Install target (optional)
install: $(TARGET)
	cp $(TARGET) /usr/local/bin/

# Uninstall target (optional)
uninstall:
	rm -f /usr/local/bin/$(TARGET)

# Force rebuild
rebuild: clean all

# Show help
help:
	@echo "Available targets:"
	@echo "  all      - Build the l81 executable (default)"
	@echo "  debug    - Build with debug symbols and no optimization"
	@echo "  clean    - Remove all build files"
	@echo "  rebuild  - Clean and rebuild"
	@echo "  install  - Install to /usr/local/bin"
	@echo "  uninstall- Remove from /usr/local/bin"
	@echo "  help     - Show this help"

# Declare phony targets
.PHONY: all debug clean install uninstall rebuild help

# Show variables (for debugging makefile)
show-vars:
	@echo "CC: $(CC)"
	@echo "CFLAGS: $(CFLAGS)"
	@echo "TARGET: $(TARGET)"
	@echo "SOURCES: $(SOURCES)"
	@echo "OBJECTS: $(OBJECTS)"
	@echo "HEADERS: $(HEADERS)"