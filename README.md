# Inventory Platform — Engineer Mobile App (Flutter)

A mobile app designed for engineers working on different project sites.

Engineers can:

- Raise material requests (MR)
- Track approval & fulfillment status
- Check store stock availability
- Scan QR-coded product lists
- View transfer status updates

---

## 🧩 Part of the Centralized Inventory Platform

- Platform Overview  
  👉 https://github.com/Whoolab-Technologies/inventory-platform
- Shared Mobile Components  
  👉 https://github.com/Whoolab-Technologies/inventory-flutter-common
- API Server  
  👉 https://github.com/Whoolab-Technologies/inventory-api
- Admin Web App  
  👉 https://github.com/Whoolab-Technologies/inventory-admin-web
- Storekeeper App  
  👉 https://github.com/Whoolab-Technologies/inventory-storekeeper-flutter

---

## ✨ Engineer Features

- Scan products via QR
- Raise MR for required materials
- View request workflow status
- Track transfers & delivery stage
- Check availability before requesting

---

## 🛠️ Tech

- Flutter
- Shared Component Library

---

## 🚀 Local Setup

### 1. Clone the Project

```bash
git clone <repository_url>
cd inventory-engineer-flutter
```

> **Note:** This project depends on `mvp_shared_components`. Ensure the shared repository is cloned in the sibling directory:
> ```bash
> cd ..
> git clone https://github.com/Whoolab-Technologies/inventory-flutter-common.git
> cd inventory-engineer-flutter
> ```

### 2. Flutter Environment

This project uses **Flutter 3.24.5** (defined in `.fvmrc`).

It is recommended to use [FVM](https://fvm.app/) to manage the version:

```bash
fvm install
fvm use
```

### 3. Install Dependencies

```bash
fvm flutter pub get
```

### 4. Code Generation

Run `build_runner` to generate code for JSON serialization, Freezed, and dependency injection:

```bash
dart run build_runner watch --use-polling-watcher --delete-conflicting-outputs
```

### 5. Firebase Setup

This project uses Firebase. You need to configure it for your environment.

1. Install the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/).
2. Login to Firebase: `firebase login`
3. Configure the project:

```bash
flutterfire configure
```

Select your Firebase project and the platforms (Android, iOS) to generate `firebase_options.dart`.

### 6. Build Android App

To build a release APK or App Bundle, you need to configure the signing keys.

1. Create a file named `key.properties` in the `android/` directory.
2. Add your keystore details to `android/key.properties`:

```properties
storePassword=<your_store_password>
keyPassword=<your_key_password>
keyAlias=<your_key_alias>
storeFile=<path_to_your_keystore.jks>
```

3. Build the APK or App Bundle:

```bash
# Build APK
fvm flutter build apk --release

# Build App Bundle
fvm flutter build appbundle --release
```

---

## 🏷️ License

This project is open-source for learning and evaluation purposes.

❗ Commercial use, resale, hosting as a service, or redistribution is not permitted.

For commercial licensing, customization, or deployment:

📩 mail@whoolab.com

---

## 💼 Business Usage & Enhancements

We support:

- Custom MR workflows
- Project-based reporting models
- Organization-specific extensions

📩 mail@whoolab.com
