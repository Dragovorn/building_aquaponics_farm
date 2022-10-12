#!/bin/bash

# Load config

echo "Reading variables from config.sh"
source config.sh

# Clean Mod

if [ -d "./build/" ]; then
  echo "Cleaning old build..."
  rm -vfr ./build/
fi

if [ -d "$MOD_INSTALL_PATH" ]; then
  echo "Mod already installed, cleaning old install..."
  rm -vfr "$MOD_INSTALL_PATH"
  rm -vf "$MOD_INSTALL_DIRECTORY/$MOD_FILE"
fi

# Build Mod

echo "Building mod..."
mkdir build
cp -vr src/* build/

# TODO: Apply special build logic; i.e. inject config values etc

echo "Done building mod!"

# Install Mod

echo "Installing mod..."
mkdir -p "$MOD_INSTALL_PATH"
cp -vr ./build/* "$MOD_INSTALL_PATH"
mv -v "$MOD_INSTALL_PATH/$MOD_FILE" "$MOD_INSTALL_DIRECTORY/"
echo "Done installing mod to: $MOD_INSTALL_DIRECTORY"
