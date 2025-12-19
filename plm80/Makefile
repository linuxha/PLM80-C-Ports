# Makefile for plm80 - Intel PL/M 80 Compiler (C++ version)
# Copyright (C) 2021 Mark Ogden

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -O2 -I.
LDFLAGS = 

# Target executable
TARGET = plm80

# Source files
SOURCES = plm.cpp common.cpp io.cpp plmov0.cpp plmov1.cpp plmov2.cpp \
          plmov3.cpp plmov4.cpp plmov5.cpp plmov6.cpp trace.cpp version.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Header files
HEADERS = plm.hpp common.hpp trace.hpp Generated/version.h

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Generate version header
Generated/version.h: version.in
	@mkdir -p Generated
	cp version.in Generated/version.h

# Compile source files to object files
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Debug build
debug: CXXFLAGS += -g -DDEBUG -O0
debug: $(TARGET)

# Release build
release: CXXFLAGS += -DNDEBUG
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