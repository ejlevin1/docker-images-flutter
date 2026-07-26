> [!NOTE]
> This is a fork of [cirruslabs/docker-images-flutter](https://github.com/cirruslabs/docker-images-flutter), rebuilt to publish independently via GitHub Actions.

# Docker Images for [Flutter](https://flutter.dev/)

[![Build and Publish Flutter Docker Images][build_badge]][build_link]

Run locally via Docker:

```bash
docker run --rm -it -v ${PWD}:/build --workdir /build ghcr.io/ejlevin1/flutter:stable flutter test
```

The example above simply mounts the current working directory and runs `flutter test`.

Images are built for `latest`, `stable`, and `beta` channels (see [flutter-versions.yml](flutter-versions.yml)) and rebuilt automatically when that file is updated by [scripts/update_flutter_versions.sh](scripts/update_flutter_versions.sh).

## GitHub Container Registry

https://github.com/ejlevin1/docker-images-flutter/pkgs/container/flutter

[build_badge]: https://github.com/ejlevin1/docker-images-flutter/actions/workflows/build.yml/badge.svg
[build_link]: https://github.com/ejlevin1/docker-images-flutter/actions/workflows/build.yml
