#!/bin/bash
set -e

# Install Oracle Java JDK 8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
addAptRepoCommand=software-properties-common

# Install necesary packages (i386 stuff is required for Android 32-bit build; gperf is used by ndk-build)
dpkg --add-architecture i386
apt-get update
apt-get install -y \
  $addAptRepoCommand \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  zlib1g:i386 \
  wget \
  unzip \
  libxml2-utils \
  python-software-properties \
  gperf
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y --no-install-recommends oracle-java8-installer
java -version # make sure we've got the right one

# Grab Android SDK
mkdir -p ${ANDROID_SDK}
cd ${ANDROID_SDK}
wget -nv -O android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip android-sdk.zip
rm -f android-sdk.zip

# Install Android SDK and NDK
echo y | ${ANDROID_SDK}/tools/bin/sdkmanager \
	"platforms;android-26" \
	"build-tools;26.0.3" \
	ndk-bundle \
	platform-tools

# Install nodejs 8.x
nodeScript=setup_8.x
wget -O $nodeScript https://deb.nodesource.com/setup_8.x
chmod +x $nodeScript
./$nodeScript
rm $nodeScript
apt-get install -y nodejs

# Install Titanium SDK and Alloy
npm install -g \
  titanium@${TITANIUM_CLI_VERSION} \
  alloy@${ALLOY_VERSION} \
  tisdk

# Grab Titanium SDK
tisdk install ${TISDK_VERSION}

# Configure Android SDK/NDK path in Titanium CLI
titanium config android.sdk ${ANDROID_SDK}
titanium config android.ndk ${ANDROID_NDK}

apt-get -y autoremove
apt-get --assume-yes clean
rm -rf \
	/var/lib/apt/lists/* \
	/tmp/* \
	/var/tmp/*
