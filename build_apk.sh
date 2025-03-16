#!/bin/bash

# Extract app name and version from pubspec.yaml
APP_NAME=$(grep '^name:' pubspec.yaml | awk '{print $2}')
VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d+ -f1)  # Extract only x.y.z from x.y.z+build

# Define output path
APK_DIR="build/app/outputs/flutter-apk"
APK_NAME="$APP_NAME-$VERSION-release.apk"

# Build APK
fvm flutter build apk --release 

# Rename APK
mv "$APK_DIR/app-release.apk" "$APK_DIR/$APK_NAME"

echo "APK renamed to: file://$(realpath $APK_DIR/$APK_NAME)"

