# Laza

A Flutter e-commerce app.

## Requirements

- Flutter **3.47.1** (latest stable)
- Dart **3.13.1** (bundled with Flutter)

## Setup

```bash
git clone https://github.com/skhasan-dev/laza.git
cd laza
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## iOS (macOS only)

```bash
cd ios && pod install && cd ..
```