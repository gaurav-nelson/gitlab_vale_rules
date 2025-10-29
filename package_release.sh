#!/bin/bash

# Script to package GitLab Vale Rules for release
# Creates a zip file with the proper structure for Vale

set -e  # Exit on error

RELEASE_DIR="GitLab_Vale_Rules"
OUTPUT_FILE="GitLab_Vale_Rules.zip"

echo "=========================================="
echo "Packaging GitLab Vale Rules for Release"
echo "=========================================="
echo ""

# Clean up any existing release directory or zip
if [ -d "$RELEASE_DIR" ]; then
    echo "Cleaning up previous release directory..."
    rm -rf "$RELEASE_DIR"
fi

if [ -f "$OUTPUT_FILE" ]; then
    echo "Removing previous release zip..."
    rm "$OUTPUT_FILE"
fi

# Create the release directory structure
echo "Creating release directory structure..."
mkdir -p "$RELEASE_DIR/styles/gitlab_base"
mkdir -p "$RELEASE_DIR/styles/gitlab_docs"

# Copy .vale.ini
echo "Copying .vale.ini configuration..."
cp .vale.ini "$RELEASE_DIR/"

# Copy gitlab_base rules
echo "Copying gitlab_base rules..."
cp gitlab_base/*.yml "$RELEASE_DIR/styles/gitlab_base/"

# Copy gitlab_docs rules
echo "Copying gitlab_docs rules..."
cp gitlab_docs/*.yml "$RELEASE_DIR/styles/gitlab_docs/"

# Count files
base_count=$(ls -1 "$RELEASE_DIR/styles/gitlab_base" | wc -l | tr -d ' ')
docs_count=$(ls -1 "$RELEASE_DIR/styles/gitlab_docs" | wc -l | tr -d ' ')

echo ""
echo "Package contents:"
echo "  - .vale.ini"
echo "  - styles/gitlab_base/ ($base_count files)"
echo "  - styles/gitlab_docs/ ($docs_count files)"

# Create the zip file
echo ""
echo "Creating zip archive..."
zip -r "$OUTPUT_FILE" "$RELEASE_DIR" > /dev/null

# Get the zip file size
zip_size=$(ls -lh "$OUTPUT_FILE" | awk '{print $5}')

# Clean up the directory (keep only the zip)
rm -rf "$RELEASE_DIR"

echo ""
echo "=========================================="
echo "Release package created successfully!"
echo "=========================================="
echo ""
echo "Output: $OUTPUT_FILE ($zip_size)"
echo ""
echo "To use this package:"
echo "  1. Extract the zip file"
echo "  2. Copy the contents to your project"
echo "  3. Run: vale --config=.vale.ini your-file.md"
