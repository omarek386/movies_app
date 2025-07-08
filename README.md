# Movies App 🎬

A Flutter application built with Clean Architecture for browsing and discovering movies. This project demonstrates modern Flutter development practices with state management, localization, and Firebase integration.

## ✨ Features

- **Authentication**: Sign up and login functionality with Firebase Auth
- **Splash Screen**: Beautiful animated splash screen with Lottie animations
- **Onboarding**: Interactive onboarding flow for new users
- **Localization**: Multi-language support (English & Arabic) with Easy Localization
- **Theme Management**: Light and dark theme support with state management
- **Responsive Design**: Adaptive UI using Flutter ScreenUtil
- **State Management**: BLoC pattern for predictable state management
- **Network Layer**: Dio for HTTP requests with error handling
- **Caching**: Local data persistence with SharedPreferences
- **Clean Architecture**: Organized code structure with separation of concerns

## 🏗️ Architecture

This project follows **Clean Architecture** principles with the following structure:

```text
lib/
├── core/                     # Shared functionality
│   ├── constants/           # App constants and configurations
│   ├── cubit/              # Global state management (Theme, Locale)
│   ├── errors/             # Error handling and exceptions
│   ├── extensions/         # Dart extensions for utilities
│   ├── network/            # HTTP client and API services
│   ├── routing/            # App navigation and routes
│   ├── services/           # External services integration
│   ├── theme/              # App theming and styling
│   └── utils/              # Utility functions and helpers
├── features/                # Feature modules
│   ├── splash/             # Splash screen feature
│   ├── onboarding/         # Onboarding flow feature
│   └── auth/               # Authentication feature
│       ├── data/           # Data layer (repositories, data sources)
│       ├── domain/         # Domain layer (entities, use cases)
│       └── presentation/   # Presentation layer (pages, widgets, BLoC)
├── app.dart                # Main app widget
├── main.dart               # App entry point
├── app_bloc_observer.dart  # BLoC observer for debugging
└── firebase_options.dart   # Firebase configuration
```

## 🛠️ Tech Stack

### Core Dependencies

- **Flutter**: Cross-platform mobile development framework
- **Firebase**: Backend services (Auth, Core)
- **BLoC**: State management and business logic
- **Dio**: HTTP client for API requests
- **Get It**: Dependency injection
- **Easy Localization**: Internationalization support

### UI & Animation

- **Flutter ScreenUtil**: Responsive screen adaptation
- **Lottie**: Vector animations
- **Animate Do**: Simple animations
- **Flutter Animate**: Advanced animations
- **Google Fonts**: Custom typography
- **Flutter SVG**: SVG image support
- **Cached Network Image**: Image caching

### Data & Storage

- **SharedPreferences**: Local data persistence
- **Dartz**: Functional programming utilities
- **Freezed**: Code generation for immutable classes
- **JSON Annotation**: JSON serialization

### Development Tools

- **Build Runner**: Code generation
- **BLoC Test**: Testing BLoC components
- **Mockito**: Mocking for unit tests
- **Flutter Lints**: Code quality and style

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd movies_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code files**

   ```bash
   flutter packages pub run build_runner build
   ```

4. **Configure Firebase**

   - Add your `google-services.json` file to `android/app/`
   - Add your `GoogleService-Info.plist` file to `ios/Runner/`

5. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🌍 Localization

The app supports multiple languages:

- English (en) - Default
- Arabic (ar)

Language files are located in `assets/lang/` directory.

## 🎨 Theming

The app includes both light and dark themes with dynamic theme switching functionality.

## 📄 License

This project is created by **Abdalluh Essam** as a demonstration of Flutter Clean Architecture.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
