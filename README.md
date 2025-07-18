# Movies App with Weather Integration 🎬🌤️

A comprehensive Flutter application built with Clean Architecture featuring user authentication and real-time weather information. Originally designed as a movie discovery app, this project has evolved to showcase modern Flutter development practices including state management, internationalization, Firebase integration, weather API integration, geolocation services, and responsive design.

## 👨‍💻 Author

Omar Khalifa

- Project Owner & Lead Developer
- Flutter & Mobile App Development Specialist

## 📸 Screenshots

<table>
  <tr>
    <th align="center">Splash Screen</th>
    <th align="center">Onboarding</th>
    <th align="center">Login Screen</th>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/splash-screen-link" width="200" height="400" alt="Splash Screen"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/43e11c26-da9a-4572-b96f-2f6e151f5e01" width="200" height="400" alt="Onboarding"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/c51b2be4-5859-491e-a9c0-413e3074d860" width="200" height="400" alt="Login Screen"/>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th align="center">Sign Up Screen</th>
    <th align="center">Weather Home</th>
    <th align="center">Weather Search</th>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/e09e3272-86a4-4975-8dad-0db04f8ccdc3" width="200" height="400" alt="Sign Up Screen"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/adc9751e-e0bd-4ad5-a5fa-0af007e05c98" width="200" height="400" alt="Weather Home Screen"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/5bcccfec-a509-4e9d-8b3e-436e4e65b533" width="200" height="400" alt="Weather Search Screen"/>
    </td>
  </tr>
</table>

> **Note**: Weather screen screenshots will be updated with actual app screenshots. The current app features a comprehensive weather interface with real-time data, 3-day forecasts, and location-based weather detection.

## ✨ Features

- **🔐 Authentication System**:

  - User registration with email verification
  - Secure login/logout functionality
  - Firebase Auth integration
  - Form validation and error handling

- **�️ Weather Integration**:

  - Real-time weather forecasting with 3-day forecasts
  - Location-based weather detection using GPS
  - City/country search with auto-complete suggestions
  - Weather data visualization with dynamic backgrounds
  - Sunrise/sunset times and astronomical data
  - Temperature, humidity, wind speed, and precipitation data
  - Day/night theme adaptation based on local time

- **�🎨 Modern UI/UX**:

  - Beautiful animated splash screen with Lottie animations
  - Interactive onboarding flow for new users
  - Responsive design adapting to different screen sizes
  - Smooth animations and transitions
  - Weather-adaptive backgrounds and themes

- **🌍 Internationalization**:

  - Multi-language support (English & Arabic)
  - RTL (Right-to-Left) layout support
  - Easy Localization implementation

- **🎭 Theme Management**:

  - Light and dark theme support
  - Dynamic theme switching
  - Weather-adaptive UI elements
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
  - Geolocation services integration
  - Optimized build configurations

## 🏗️ Project Structure

This project follows **Clean Architecture** principles with the following structure:

```text
movies_app/
├── lib/
│   ├── core/                    # Shared functionality
│   │   ├── constants/          # App constants and configurations
│   │   ├── cubit/             # Global state management (Theme, Locale)
│   │   ├── errors/            # Error handling and exceptions
│   │   ├── extensions/        # Dart extensions for utilities
│   │   ├── network/           # HTTP client and API services
│   │   ├── routing/           # App navigation and routes
│   │   ├── services/          # External services integration
│   │   ├── theme/             # App theming and styling
│   │   └── utils/             # Utility functions and helpers
│   ├── features/               # Feature modules
│   │   ├── splash/            # Splash screen feature
│   │   ├── onboarding/        # Onboarding flow feature
│   │   ├── auth/              # Authentication feature
│   │   │   ├── data/          # Data layer (repositories, data sources)
│   │   │   ├── domain/        # Domain layer (entities, use cases)
│   │   │   └── presentation/  # Presentation layer (pages, widgets, BLoC)
│   │   └── weather/           # Weather feature
│   │       ├── data/          # Weather data layer
│   │       │   ├── datasources/   # Remote data sources
│   │       │   ├── models/        # Data models and DTOs
│   │       │   └── repositories/  # Repository implementations
│   │       ├── domain/        # Weather domain layer
│   │       │   ├── entities/      # Weather entities
│   │       │   ├── repositories/  # Repository contracts
│   │       │   └── usecases/      # Weather use cases
│   │       └── presentation/ # Weather presentation layer
│   │           ├── cubit/         # Weather state management
│   │           ├── pages/         # Weather screens
│   │           └── widgets/       # Weather UI components
│   │   └── auth/              # Authentication feature
│   │       ├── data/          # Data layer (repositories, data sources)
│   │       ├── domain/        # Domain layer (entities, use cases)
│   │       └── presentation/  # Presentation layer (pages, widgets, BLoC)
│   ├── app.dart               # Main app widget configuration
│   ├── main.dart              # App entry point
│   ├── app_bloc_observer.dart # BLoC observer for debugging
│   └── firebase_options.dart  # Firebase configuration
├── assets/                     # App assets
│   ├── icons/                 # App icons
│   ├── images/                # Image resources
│   ├── lang/                  # Localization files (en.json, ar.json)
│   └── lottie/                # Lottie animation files
├── android/                   # Android-specific files
├── ios/                       # iOS-specific files
├── web/                       # Web-specific files
├── windows/                   # Windows-specific files
├── macos/                     # macOS-specific files
├── linux/                     # Linux-specific files
├── test/                      # Unit and widget tests
├── pubspec.yaml              # Dependencies and project configuration
└── README.md                 # Project documentation
```

## 🛠️ Tech Stack

### Core Dependencies

- **Flutter**: Cross-platform mobile development framework
- **Firebase**: Backend services (Auth, Core)
- **BLoC**: State management and business logic
- **Dio**: HTTP client for API requests
- **Get It**: Dependency injection
- **Easy Localization**: Internationalization support

### Weather & Location Services

- **Geolocator**: GPS location services for weather detection
- **Geocoding**: Address and location geocoding
- **Weather API**: Real-time weather data and forecasting
- **Location Permissions**: Handle location access permissions

### UI & Animation

- **Flutter ScreenUtil**: Responsive screen adaptation
- **Lottie**: Vector animations
- **Animate Do**: Simple animations
- **Flutter Animate**: Advanced animations
- **Google Fonts**: Custom typography
- **Flutter SVG**: SVG image support
- **Cached Network Image**: Image caching
- **Intl**: Date formatting and internationalization

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
- WeatherAPI account for weather data

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

5. **Configure Weather API**

   - Sign up for a free account at [WeatherAPI.com](https://www.weatherapi.com/)
   - Get your API key from the dashboard
   - Add your API key to `lib/core/constants/api_keys.dart`:

     ```dart
     class ApiKeys {
       static const String weatherApiKey = 'your_weather_api_key_here';
     }
     ```

6. **Configure Location Permissions**

   - **Android**: Location permissions are already configured in `android/app/src/main/AndroidManifest.xml`
   - **iOS**: Location permissions are configured in `ios/Runner/Info.plist`

7. **Run the app**

   ```bash
   flutter run
   ```

## 🔥 Firebase Setup

This app uses Firebase for authentication. To set up Firebase:

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and Email/Password sign-in method
3. Add your Android/iOS app configuration files
4. Run `flutterfire configure` to generate Firebase options (optional)

## 🌤️ Weather API Setup

The weather feature uses [WeatherAPI.com](https://www.weatherapi.com/) for real-time weather data:

1. Create a free account at WeatherAPI.com
2. Obtain your API key from the dashboard
3. The free tier includes:
   - Current weather data
   - 3-day weather forecast
   - Weather alerts
   - Location search with autocomplete
   - Historical weather data (limited)

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
