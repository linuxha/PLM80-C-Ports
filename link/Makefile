# Makefile for link - Intel 8080 Linker
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O2 -I.
LDFLAGS = 

# Target executable
TARGET = link

# Source files
SOURCES = link.c link1a.c link3.c link3a.c linkov.c binasc.c \
          errrpt.c io.c lineuc.c mkfnam.c pstafn.c pstfn.c \
          skpspc.c strequ.c wrerr.c version.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = link.h error.h

# Default target
all: Generated/version.h $(TARGET)

# Generate version header
Generated/version.h: version.in
	@mkdir -p Generated
	cp version.in Generated/version.h

# Build the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compile source files to object files  
%.o: %.c $(HEADERS) Generated/version.h
	$(CC) $(CFLAGS) -c $< -o $@

# Debug build
debug: CFLAGS += -g -DDEBUG -O0
debug: $(TARGET)

# Release build
release: CFLAGS += -DNDEBUG
release: $(TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET) Generated/version.h
	rmdir Generated 2>/dev/null || true

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