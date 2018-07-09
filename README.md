# Titanium Docker

Appcelerator Titanium Docker image to build Android

## Quickstart

  1. generate keystore as per [the doco](https://docs.appcelerator.com/platform/latest/#!/guide/Distributing_Android_apps-section-src-29004925_DistributingAndroidapps-Generateakeypairandcertificate). Note: make sure you **use `tibuild` as the alias** and **set the key password as the same as the keystore password** !
      ```bash
      keystorePath=your.keystore
      keytool \
        -genkeypair \
        -v \
        -keystore $keystorePath \
        -alias tibuild \
        -keyalg RSA \
        -sigalg SHA1withRSA \
        -validity 1000
      ```
  1. Base64 encode your keystore
      ```bash
      cat $keystorePath | base64 -w0 > keystore.b64
      ```
  1. change into your source repo
      ```bash
      cd /path/to/your/titanium/app/
      ```
  1. run the Docker image
      ```bash
      docker run \
        --rm \
        -e KEYSTORE_BASE64=$(cat keystore.b64) \
        -e KEYSTORE_PASS=<your keystore password> \
        -v $(pwd):/work \
        tomsaleeba/ti.build
      ```

## Credits

- [tisdk](https://www.npmjs.com/package/tisdk) install Titanium SDK
- Original Docker image [devillers/ti.build](https://github.com/MartinDevillers/ti.build)

## TODOs

- [x] Update to latest dependencies
- [x] Autodetect SDK version from tiapp.xml
- [ ] Install Alloy only if required
- [ ] Add example for BitBucket Pipelines
- [ ] Add example with [TiFastlane](https://github.com/ulizama/TiFastlane) to update Google Play (push builds, update meta ... etc)
- [ ] Add iOS support
