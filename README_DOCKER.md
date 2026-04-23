# reMELD-Na Docker Build Environment

Builds a release APK without needing Flutter or Android SDK installed locally.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) installed on your machine
- Your `android/key.properties` and keystore file in place (for signed builds)

## Setup

Copy the three files from this folder into the **root** of your Flutter project:
```
remeldna_calculator/
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── lib/
├── android/
├── pubspec.yaml
└── ...
```

## First time — build the Docker image

This downloads Flutter, Android SDK etc. Takes 10–20 minutes but only once:

```bash
docker build -t remeldna-builder .
```

## Build the APK

```bash
docker compose run --rm builder
```

Or without docker-compose:

```bash
docker run --rm \
  -v $(pwd):/app \
  -v flutter_pub_cache:/root/.pub-cache \
  -v gradle_cache:/root/.gradle \
  remeldna-builder
```

The APK will appear at:
```
build/app/outputs/flutter-apk/app-release.apk
```

## Signed builds

Make sure `android/key.properties` exists with your keystore details before building.
The keystore file itself should be at `android/app/meldna_keystore.jks`.

**Never commit `key.properties` or `.jks` files to Git.**

## Faster rebuilds

The `docker-compose.yml` uses named volumes to cache:
- Flutter pub packages (`flutter_pub_cache`)
- Gradle dependencies (`gradle_cache`)

After the first build, subsequent builds are much faster (~1–2 minutes).

## Run other Flutter commands

```bash
# Get dependencies
docker compose run --rm builder flutter pub get

# Run tests
docker compose run --rm builder flutter test

# Build AAB (for Play Store)
docker compose run --rm builder flutter build appbundle --release

# Clean build
docker compose run --rm builder flutter clean
```
