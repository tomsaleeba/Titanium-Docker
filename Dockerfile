#
# Appcelerator Titanium Mobile Build Dockerfile
#
# https://github.com/HazemKhaled/Titanium-Docker
#
# Original repo https://github.com/MartinDevillers/ti.build
#

FROM ubuntu:16.04
LABEL author="Hazem Khaled <hazem.khaled@gmail.com>"

ENV TITANIUM_CLI_VERSION=5.1.1
ENV ALLOY_VERSION=1.12.0
ENV TISDK_VERSION=7.2.0.GA

ENV APP_DIR=/app
ENV WORK_DIR=/work
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/
ENV ANDROID_SDK /opt/android-sdk-linux
ENV ANDROID_NDK /opt/android-sdk-linux/ndk-bundle
ENV BUILD_DIR build
ENV TI_LOG_LEVEL info

ADD src/ ${APP_DIR}/
WORKDIR ${APP_DIR}
RUN /bin/bash setup.sh
ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]
