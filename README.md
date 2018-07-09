# Titanium Docker

Appcelerator Titanium Docker image to build Android

## Quickstart

Note that we're only building a 'dev' build here. You can't build
a production build for the playstore (i.e. `ti build --target dist-playstore`)
as that requires you to be logged into your Appcelerator account. That's
hard to do in a Docker container (in an automated way).

  1. change into your source repo
      ```bash
      cd /path/to/your/titanium/app/
      ```
  1. run the Docker image
      ```bash
      docker run \
        --rm \
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
