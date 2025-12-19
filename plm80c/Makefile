# Makefile for PLM80-C compiler
# A C port of Intel's ISIS-II PLM80 v4.0

CC = gcc
CFLAGS = -std=c99 -Wall -O2
EXECUTABLE = plm80c
SOURCES = $(wildcard *.c)

.PHONY: all clean install

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES) Generated/version.h
	$(CC) $(CFLAGS) -o $(EXECUTABLE) $(SOURCES)

Generated/version.h: version.in
	mkdir -p Generated
	cp version.in Generated/version.h

clean:
	rm -f $(EXECUTABLE)
	rm -rf Generated

install: $(EXECUTABLE)
	install -m 755 $(EXECUTABLE) /usr/local/bin/

# Test the compilation
test: $(EXECUTABLE)
	./$(EXECUTABLE) -v

help:
	@echo "Available targets:"
	@echo "  all      - Build the PLM80 compiler (default)"
	@echo "  clean    - Remove compiled binary and generated files"
	@echo "  install  - Install to /usr/local/bin"
	@echo "  test     - Test the compiled binary"
	@echo "  help     - Show this help message"