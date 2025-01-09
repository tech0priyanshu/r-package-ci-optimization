#!/bin/bash

set -e
# Input tarball

TARBALL="data.table_1.16.4.tar.gz"

if [[ ! -f "${TARBALL}" ]]; then
  echo "Error: Tarball ${TARBALL} not found."
  exit 1
fi

echo "Extracting ${TARBALL}..."
tar -xzf "$TARBALL"

# Extracted directory name (assumes format <package>)
DIR=$(basename "${TARBALL}" .tar.gz | sed 's/_.*$//')

# Check if extraction was successful
if [[ ! -d "${DIR}" ]]; then
  echo "Error: Extraction failed or directory ${DIR} not found."
  exit 1
fi

cd "$DIR"

echo "Removing unnecessary files and directories"
# List of files and directories to remove
items=(
  "inst/doc"          # Vignettes
  "inst/examples"     # Example scripts
  "tests"             # Unit tests
  "man"               # Documentation
  "vignettes"         # Vignette source files
  "src/tests"         # C/C++ test files
  ".github"           # GitHub actions and workflows
  ".*.Rbuildignore"   # R build ignore files
  "NEWS.md"           # Change log
  "README.md"         # Readme files
  "MD5"              # Removing hash code
)
for item in "${items[@]}"; do
  if [[ -e $item ]]; then
    rm -rf "$item"
  fi
done

echo "Cleanup complete."

cd ..

# Recreate a tarball with the minimal package
MINIMAL_TARBALL="${DIR}_minimal.tar.gz"
echo "Creating minimal tarball $MINIMAL_TARBALL..."
tar -czf "${MINIMAL_TARBALL}" "$DIR"

# Install the minimal package using R CMD INSTALL
echo "Installing the package using R CMD INSTALL..."
read -s -p "Password: " password
echo
echo "$password" | sudo -S R CMD INSTALL "${MINIMAL_TARBALL}"

# Cleanup
echo "Cleaning up extracted directory..."
rm -rf "${DIR}"
echo "Minimal version of ${TARBALL} installed successfully!"

