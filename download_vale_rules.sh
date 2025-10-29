#!/bin/bash

# Script to download Vale rules from GitLab repository using git sparse-checkout
# Much faster than API-based downloads

set -e  # Exit on error

REPO_URL="https://gitlab.com/gitlab-org/gitlab.git"
BRANCH="master"
TEMP_DIR="temp_gitlab_clone"

echo "=========================================="
echo "GitLab Vale Rules Downloader"
echo "Using Git Sparse Checkout"
echo "=========================================="
echo ""

# Clean up any previous temp directory
if [ -d "$TEMP_DIR" ]; then
    echo "Cleaning up previous temporary directory..."
    rm -rf "$TEMP_DIR"
fi

# Initialize a new git repository
echo "Initializing git repository..."
git init "$TEMP_DIR"
cd "$TEMP_DIR"

# Add the remote
echo "Adding GitLab remote..."
git remote add origin "$REPO_URL"

# Enable sparse checkout
echo "Enabling sparse checkout..."
git config core.sparseCheckout true

# Specify which directories to checkout
echo "Configuring sparse checkout paths..."
echo "doc/.vale/gitlab_base/" >> .git/info/sparse-checkout
echo "doc/.vale/gitlab_docs/" >> .git/info/sparse-checkout

# Pull only the specified directories
echo "Pulling files from GitLab (this may take a moment)..."
git pull --depth=1 origin "$BRANCH"

# Copy the downloaded directories to the parent directory
echo ""
echo "Copying files to local directories..."
cd ..

# Remove old directories if they exist
[ -d "gitlab_base" ] && rm -rf gitlab_base
[ -d "gitlab_docs" ] && rm -rf gitlab_docs

# Copy the new directories
cp -r "$TEMP_DIR/doc/.vale/gitlab_base" ./
cp -r "$TEMP_DIR/doc/.vale/gitlab_docs" ./

# Clean up the temporary directory
echo "Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo ""
echo "=========================================="
echo "Download complete!"
echo "=========================================="
echo ""
echo "Files downloaded to:"
for dir in "gitlab_base" "gitlab_docs"; do
    if [ -d "${dir}" ]; then
        file_count=$(ls -1 "${dir}" 2>/dev/null | wc -l | tr -d ' ')
        echo "  ./${dir}/ (${file_count} files)"
    fi
done
