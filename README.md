# Movies App 🎬

A comprehensive Flutter application built with Clean Architecture for movie discovery and user authentication. This project showcases modern Flutter development practices including ## 👨‍💻 Author

Omar Khalifa

- Project Owner & Lead Developer
- Flutter & Mobile App Development management, internationalization, Firebase integration, and responsive design.

## 📸 Screenshots

|                  Splash Screen                  |                    Onboarding                    |                 Login Screen                  |
| :---------------------------------------------: | :----------------------------------------------: | :-------------------------------------------: |
| ![Splash Screen](screenshots/splash_screen.png) | ![Onboarding](screenshots/onboarding_screen.png) | ![Login Screen](screenshots/login_screen.png) |

|                  Sign Up Screen                  |                 Home Screen                 |                  Movie Details                  |
| :----------------------------------------------: | :-----------------------------------------: | :---------------------------------------------: |
| ![Sign Up Screen](screenshots/signup_screen.png) | ![Home Screen](screenshots/home_screen.png) | ![Movie Details](screenshots/movie_details.png) |

> **📌 Note**: Please add your app screenshots to the `screenshots/` folder in the root directory. Recommended dimensions: 250x500 pixels (or maintain a 1:2 aspect ratio) for optimal display.

## ✨ Features

- **🔐 Authentication System**:
  - User registration with email verification
  - Secure login/logout functionality
  - Firebase Auth integration
  - Form validation and error handling
- **🎨 Modern UI/UX**:
  - Beautiful animated splash screen with Lottie animations
  - Interactive onboarding flow for new users
  - Responsive design adapting to different screen sizes
  - Smooth animations and transitions
- **🌍 Internationalization**:
  - Multi-language support (English & Arabic)
  - RTL (Right-to-Left) layout support
  - Easy Localization implementation
- **🎭 Theme Management**:
  - Light and dark theme support
  - Dynamic theme switching
  - Consistent design system
- **🏗️ Architecture**:
  - Clean Architecture implementation
  - BLoC pattern for state management
  - Dependency injection with GetIt
  - Separation of concerns
- **🚀 Performance**:
  - Efficient HTTP requests with Dio
  - Local data caching with SharedPreferences
  - Image caching for better performance
  - Optimized build configurations

## 🏗️ Project Structure

This project follows **Clean Architecture** principles with the following structure:

```text
movies_app/
├── lib/
│   ├── core/                     # Shared functionality
│   │   ├── constants/           # App constants and configurations
│   │   ├── cubit/              # Global state management (Theme, Locale)
│   │   ├── errors/             # Error handling and exceptions
│   │   ├── extensions/         # Dart extensions for utilities
│   │   ├── network/            # HTTP client and API services
│   │   ├── routing/            # App navigation and routes
│   │   ├── services/           # External services integration
│   │   ├── theme/              # App theming and styling
│   │   └── utils/              # Utility functions and helpers
│   ├── features/                # Feature modules
│   │   ├── splash/             # Splash screen feature
│   │   ├── onboarding/         # Onboarding flow feature
│   │   └── auth/               # Authentication feature
│   │       ├── data/           # Data layer (repositories, data sources)
│   │       ├── domain/         # Domain layer (entities, use cases)
│   │       └── presentation/   # Presentation layer (pages, widgets, BLoC)
│   ├── app.dart                # Main app widget configuration
│   ├── main.dart               # App entry point
│   ├── app_bloc_observer.dart  # BLoC observer for debugging
│   └── firebase_options.dart   # Firebase configuration
├── assets/                      # App assets
│   ├── icons/                  # App icons
│   ├── images/                 # Image resources
│   ├── lang/                   # Localization files (en.json, ar.json)
│   └── lottie/                 # Lottie animation files
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── web/                        # Web-specific files
├── windows/                    # Windows-specific files
├── macos/                      # macOS-specific files
├── linux/                      # Linux-specific files
├── screenshots/                # App screenshots for README
├── test/                       # Unit and widget tests
├── pubspec.yaml               # Dependencies and project configuration
└── README.md                  # Project documentation
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
   - Update Firebase configuration in `lib/firebase_options.dart`

5. **Run the app**

   ```bash
   flutter run
   ```

## 🔥 Firebase Setup

This app uses Firebase for authentication. To set up Firebase:

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and Email/Password sign-in method
3. Add your Android/iOS app configuration files
4. Run `flutterfire configure` to generate Firebase options (optional)

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

## �‍💻 Author

**Omar Khalifa**

- Project Owner & Lead Developer
- Flutter & Mobile App Development

## �📄 License

This project is created and owned by Omar Khalifa. It serves as a demonstration of Flutter Clean Architecture and modern mobile development practices.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
