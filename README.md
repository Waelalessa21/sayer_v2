# 🚗 Sayer - Car Marketplace Application

<div align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Dart](https://img.shields.io/badge/Dart-3.8.1-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
  ![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

  **A modern, feature-rich Flutter application for car marketplace and dealership management**

</div>

---

## 📋 Table of Contents

- [About](#about)
- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Dependencies](#dependencies)
- [Firebase Setup](#firebase-setup)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 About

Sayer is a comprehensive mobile application built with Flutter that connects car buyers with dealerships. The app provides an intuitive platform for browsing cars, managing favorites, tracking activities, and handling dealership leads efficiently.

---

## ✨ Features

### 🔐 Authentication
- Phone number authentication with OTP verification
- Firebase authentication integration
- Secure storage for user credentials

### 🏠 Home & Discovery
- Browse available cars and dealerships
- Featured offers and brand promotions
- Smart search functionality
- Real-time updates with Firebase

### 🚙 Car Management
- Detailed car listings
- Advanced filtering and search
- Save favorite vehicles
- Compare multiple cars

### 💼 Dealership Features
- Dealership profiles
- Lead management system
- Activity tracking
- Business analytics

### 🎁 Offers & Promotions
- Exclusive deals
- Brand-specific offers
- Installment plans
- Discount tracking

### 📱 User Experience
- Beautiful onboarding flow
- Dark/Light theme support (customizable)
- Responsive design across all devices
- Smooth animations and transitions
- Push notifications
- In-app notifications

### 🛠️ Additional Features
- Mehtar (expert advisor) service
- Customer support integration
- About us section
- Activity history

---

## 📸 Screenshots

> Add your app screenshots here to showcase the UI/UX

---

## 🛠️ Tech Stack

### Frontend
- **Framework:** Flutter 3.8.1
- **Language:** Dart 3.8.1
- **State Management:** BLoC (flutter_bloc)
- **Dependency Injection:** GetIt
- **Navigation:** Get

### Backend & Services
- **Authentication:** Firebase Auth
- **Database:** Cloud Firestore
- **Push Notifications:** Firebase Messaging
- **Remote Config:** Firebase Remote Config
- **API Integration:** Retrofit + Dio

### Key Libraries
- **UI/UX:** 
  - flutter_screenutil (Responsive design)
  - animate_do (Animations)
  - lottie (Lottie animations)
  - animated_introduction (Onboarding)
  
- **Code Generation:**
  - freezed (Immutable models)
  - json_serializable (JSON parsing)
  - retrofit_generator (API clients)

- **Storage:**
  - shared_preferences (Local storage)
  - flutter_secure_storage (Secure storage)

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.8.1 or higher)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS development)
- [Git](https://git-scm.com/)
- A Firebase project (see [Firebase Setup](#firebase-setup))

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sarsolation/sayer_v2.git
   cd sayer_v2
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase**
   - Add your `google-services.json` (Android) to `android/app/`
   - Add your `GoogleService-Info.plist` (iOS) to `ios/Runner/`
   - Update `lib/firebase_options.dart` with your Firebase configuration

5. **Setup native splash screen**
   ```bash
   flutter pub run flutter_native_splash:create
   ```

### Running the App

#### Debug Mode
```bash
flutter run
```

#### Release Mode
```bash
flutter run --release
```

#### Build APK (Android)
```bash
flutter build apk --release
```

#### Build IPA (iOS)
```bash
flutter build ios --release
```

---

## 📁 Project Structure

```
lib/
├── common/                      # Shared code across the app
│   ├── business/               # Business logic models
│   │   ├── dealership/        # Dealership business models
│   │   ├── leads/             # Lead management models
│   │   ├── notification/      # Notification models
│   │   └── user/              # User models
│   ├── constants/             # App-wide constants
│   ├── data/                  # Data layer
│   │   ├── Cars/              # Car data models
│   │   ├── dealerships/       # Dealership data models
│   │   ├── leads/             # Lead data models
│   │   └── user/              # User data models
│   ├── di/                    # Dependency injection
│   ├── helpers/               # Utility functions
│   ├── layout/                # Layout components
│   ├── networking/            # API and network layer
│   ├── routing/               # Navigation and routing
│   ├── theming/               # App themes and styles
│   └── widgets/               # Reusable widgets
├── features/                   # Feature modules
│   ├── about_us/
│   ├── activity/
│   ├── brand_offers/
│   ├── brands/
│   ├── favourite/
│   ├── home/
│   ├── login/
│   ├── mehtar/
│   ├── offers/
│   ├── onBoarding/
│   ├── otp/
│   ├── search/
│   ├── services/
│   └── support/
├── firebase_options.dart       # Firebase configuration
├── main.dart                   # App entry point
└── sayer_app.dart             # Root app widget
```

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **BLoC** pattern for state management:

- **Presentation Layer:** UI components and BLoC/Cubit
- **Business Logic Layer:** Use cases and business models
- **Data Layer:** Repositories, data sources, and API clients

### Design Patterns Used
- **BLoC Pattern:** For state management
- **Repository Pattern:** For data abstraction
- **Dependency Injection:** Using GetIt
- **Code Generation:** For models and API clients (Freezed, Retrofit)

---

## 📦 Dependencies

### Core Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| flutter_bloc | ^9.1.1 | State management |
| get_it | ^8.2.0 | Dependency injection |
| dio | ^5.9.0 | HTTP client |
| retrofit | ^4.7.2 | Type-safe API client |
| freezed | ^3.2.3 | Code generation for models |
| firebase_core | ^4.1.1 | Firebase initialization |
| firebase_auth | ^6.1.0 | Authentication |
| cloud_firestore | ^6.0.2 | Cloud database |
| firebase_messaging | ^16.0.2 | Push notifications |
| flutter_screenutil | ^5.9.3 | Responsive UI |
| shared_preferences | ^2.5.3 | Local storage |
| flutter_secure_storage | ^9.2.4 | Secure storage |

For a complete list, see [pubspec.yaml](pubspec.yaml)

---

## 🔥 Firebase Setup

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use an existing one

2. **Add Android App**
   - Register your app with package name from `android/app/build.gradle.kts`
   - Download `google-services.json`
   - Place it in `android/app/`

3. **Add iOS App**
   - Register your app with bundle ID from `ios/Runner/Info.plist`
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/`

4. **Enable Firebase Services**
   - Authentication (Phone Sign-In)
   - Cloud Firestore
   - Cloud Messaging
   - Remote Config

5. **Configure FlutterFire**
   ```bash
   flutterfire configure
   ```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Write unit tests for new features
- Update documentation as needed

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Authors

**Sarsolation**
- Website: [sayer.sa](https://sayer.sa)
- Email: support@sayer.sa

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All open-source contributors whose packages made this project possible

---

## 📞 Support

For support, email support@sayer.sa or visit our website at [sayer.sa](https://sayer.sa)

---

<div align="center">
  
  **Made with ❤️ using Flutter**
  
  ⭐ Star this repo if you find it helpful!
  
</div>
# sayer-android
