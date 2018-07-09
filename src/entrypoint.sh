#!/bin/bash
set -e

# clear old builds
rm -fr $BUILD_DIR

# do the build
cd $WORK_DIR
ti build \
 --platform android \
 --build-only \
 --output-dir $BUILD_DIR \
 --log-level $TI_LOG_LEVEL \
 --no-prompt

binDir=build/android/bin/
echo "You should see your APK in $binDir"
ls -lh $binDir/*.apk
