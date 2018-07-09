#!/bin/bash
set -e

: ${KEYSTORE_BASE64:?}
: ${KEYSTORE_ALIAS:?}
: ${KEYSTORE_PASS:?}

# write keystore to file
echo $KEYSTORE_BASE64 | base64 -d > $KEYSTORE_PATH

# clear old builds
rm -fr $BUILD_DIR

# do the build
cd $WORK_DIR
ti build \
 --platform android \
 --build-only \
 --keystore $KEYSTORE_PATH \
 --store-password $KEYSTORE_PASS \
 --alias $KEYSTORE_ALIAS \
 --output-dir $BUILD_DIR \
 --log-level $TI_LOG_LEVEL \
 --no-prompt

binDir=build/android/bin/
echo "You should see your APK in $binDir"
ls -lh $binDir/*.apk
