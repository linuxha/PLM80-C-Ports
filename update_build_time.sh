#!/bin/bash
#
# update_build_time.sh - Update GIT_CTIME to current date/time in all version.in files
# Usage: ./update_build_time.sh
#

set -e

# Get current timestamp in the format used by the project
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')
CURRENT_YEAR=$(date '+%Y')

echo "Updating GIT_CTIME to: $CURRENT_TIME"
echo "Updating GIT_YEAR to: $CURRENT_YEAR"
echo

# Find all version.in files and update GIT_CTIME
find . -name "version.in" -type f | while read -r file; do
    if grep -q "GIT_CTIME" "$file"; then
        echo "Updating $file"
        # Use sed to replace the GIT_CTIME line with current timestamp
        sed -i "s/#define GIT_CTIME.*/#define GIT_CTIME       \"$CURRENT_TIME\"/;s/#define GIT_YEAR.*/#define GIT_YEAR       \"$CURRENT_YEAR\"/" "$file"
    fi
done

echo
echo "Update complete. Modified files:"
find . -name "version.in" -type f -exec grep -l "GIT_CTIME.*$CURRENT_TIME" {} \;

echo
echo "Note: You may need to run 'make clean && make all' to regenerate version.c files"
