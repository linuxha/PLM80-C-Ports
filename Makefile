# Master Makefile for PLM80-C-Ports Project
# Copyright (C) 2021 Mark Ogden
# Builds all Intel 8080/8085 development tools

# Project directories and their corresponding executables
PROGRAMS = asm80 binobj hexobj l81 l82 l83 lib link locate ml80 objhex plm80 plm80c plm81 plm82

# Default target
all: $(PROGRAMS)
	@echo "All programs built successfully!"

# Individual program targets
asm80:
	@echo "Building asm80..."
	@$(MAKE) -C asm80

binobj:
	@echo "Building binobj..."
	@$(MAKE) -C binobj

hexobj:
	@echo "Building hexobj..."
	@$(MAKE) -C hexobj

l81:
	@echo "Building l81..."
	@$(MAKE) -C l81

l82:
	@echo "Building l82..."
	@$(MAKE) -C l82

l83:
	@echo "Building l83..."
	@$(MAKE) -C l83

lib:
	@echo "Building lib..."
	@$(MAKE) -C lib

link:
	@echo "Building link..."
	@$(MAKE) -C link

locate:
	@echo "Building locate..."
	@$(MAKE) -C locate

ml80:
	@echo "Building ml80..."
	@$(MAKE) -C ml80

objhex:
	@echo "Building objhex..."
	@$(MAKE) -C objhex

plm80:
	@echo "Building plm80..."
	@$(MAKE) -C plm80

plm80c:
	@echo "Building plm80c..."
	@$(MAKE) -C plm80c

plm81:
	@echo "Building plm81..."
	@$(MAKE) -C plm81

plm82:
	@echo "Building plm82..."
	@$(MAKE) -C plm82

# Clean all programs
clean:
	@echo "Cleaning all programs..."
	@for dir in $(PROGRAMS); do \
		echo "Cleaning $$dir..."; \
		$(MAKE) -C $$dir clean; \
	done

# Deep clean (distclean)
distclean:
	@echo "Deep cleaning all programs..."
	@for dir in $(PROGRAMS); do \
		echo "Deep cleaning $$dir..."; \
		$(MAKE) -C $$dir distclean 2>/dev/null || $(MAKE) -C $$dir clean; \
	done

# Debug builds
debug:
	@echo "Building all programs in debug mode..."
	@for dir in $(PROGRAMS); do \
		echo "Debug building $$dir..."; \
		$(MAKE) -C $$dir debug 2>/dev/null || echo "Debug target not available for $$dir"; \
	done

# Release builds
release:
	@echo "Building all programs in release mode..."
	@for dir in $(PROGRAMS); do \
		echo "Release building $$dir..."; \
		$(MAKE) -C $$dir release 2>/dev/null || $(MAKE) -C $$dir all; \
	done

# Install all programs
install:
	@echo "Installing all programs..."
	@for dir in $(PROGRAMS); do \
		echo "Installing $$dir..."; \
		$(MAKE) -C $$dir install 2>/dev/null || echo "Install target not available for $$dir"; \
	done

# Uninstall all programs
uninstall:
	@echo "Uninstalling all programs..."
	@for dir in $(PROGRAMS); do \
		echo "Uninstalling $$dir..."; \
		$(MAKE) -C $$dir uninstall 2>/dev/null || echo "Uninstall target not available for $$dir"; \
	done

# Test all programs (show version info)
test:
	@echo "Testing all programs..."
	@for dir in $(PROGRAMS); do \
		if [ -f $$dir/$$dir ]; then \
			echo "Testing $$dir:"; \
			$$dir/$$dir -v 2>/dev/null || echo "$$dir built but version test failed"; \
		else \
			echo "$$dir not built yet"; \
		fi; \
	done

# Show help
help:
	@echo "PLM80-C-Ports Master Makefile"
	@echo "=============================="
	@echo ""
	@echo "Available targets:"
	@echo "  all       - Build all programs (default)"
	@echo "  clean     - Clean all build artifacts"
	@echo "  distclean - Deep clean all build artifacts"
	@echo "  debug     - Build all programs with debug info"
	@echo "  release   - Build all programs optimized for release"
	@echo "  install   - Install all programs to /usr/local/bin"
	@echo "  uninstall - Uninstall all programs"
	@echo "  test      - Test all built programs"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Individual program targets:"
	@echo "  $(PROGRAMS)"
	@echo ""
	@echo "Program descriptions:"
	@echo "  asm80   - Intel 8080 Assembler"
	@echo "  binobj  - Binary to Object converter"
	@echo "  hexobj  - Intel HEX to Object converter"
	@echo "  l81     - Intel 8080 Linker L81"
	@echo "  l82     - Intel 8080 Linker L82"
	@echo "  l83     - Intel 8080 Linker L83"
	@echo "  lib     - Intel Library Manager"
	@echo "  link    - Intel 8080 Linker"
	@echo "  locate  - Intel Locater/Linker utility"
	@echo "  ml80    - Intel 8080 Macro Assembler"
	@echo "  objhex  - Object to Intel HEX converter"
	@echo "  plm80   - Intel PL/M 80 Compiler (C++ version)"
	@echo "  plm80c  - Intel PL/M 80 Compiler (C version)"
	@echo "  plm81   - Intel PL/M 81 Compiler"
	@echo "  plm82   - Intel PL/M 82 Compiler"

# Status check - show which programs are built
status:
	@echo "Build status:"
	@echo "============="
	@for dir in $(PROGRAMS); do \
		if [ -f $$dir/$$dir ]; then \
			echo "  ✓ $$dir - Built"; \
		else \
			echo "  ✗ $$dir - Not built"; \
		fi; \
	done

.PHONY: all clean distclean debug release install uninstall test help status $(PROGRAMS)