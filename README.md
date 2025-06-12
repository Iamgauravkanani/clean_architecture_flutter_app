# Flutter Posts Hub - Clean Architecture Demo

A modern Flutter application showcasing best practices in mobile development, featuring a posts management system built with clean architecture principles. This project demonstrates API integration with JSONPlaceholder, state management with Riverpod, dependency injection with GetIt, and Firebase Crashlytics integration.

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── injection_container.dart    # GetIt dependency injection setup
│   └── routes/
│       └── app_router.dart            # App routing configuration
├── features/
│   └── posts/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── post_remote_data_source.dart    # API data source
│       │   ├── models/
│       │   │   └── post_model.dart                 # Data models
│       │   └── repositories/
│       │       └── post_repository_impl.dart       # Repository implementation
│       ├── domain/
│       │   ├── entities/
│       │   │   └── post.dart                      # Business entities
│       │   ├── repositories/
│       │   │   └── post_repository.dart           # Repository interfaces
│       │   └── usecases/
│       │       └── get_posts.dart                 # Business logic
│       └── presentation/
│           ├── pages/
│           │   └── home_page.dart                 # UI pages
│           └── providers/
│               └── post_provider.dart             # State management
└── main.dart                                    # App entry point
```

## 🎯 Features

- Clean Architecture implementation
- API integration with JSONPlaceholder
- State management using Riverpod
- Dependency injection with GetIt
- Firebase Crashlytics integration
- Error handling
- Loading states
- Responsive UI

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Riverpod**: State management
- **GetIt**: Dependency injection
- **Firebase Crashlytics**: Error tracking
- **HTTP**: API communication

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  get_it: ^7.6.4
  http: ^1.1.0
  firebase_core: ^2.24.2
  firebase_crashlytics: ^3.4.9
```

## 🏗️ Architecture

### Clean Architecture Layers

1. **Presentation Layer**
   - Contains UI components (pages)
   - State management (providers)
   - User interactions
   - Located in `features/*/presentation/`

2. **Domain Layer**
   - Business logic
   - Entities
   - Repository interfaces
   - Use cases
   - Located in `features/*/domain/`

3. **Data Layer**
   - Repository implementations
   - Data sources
   - Models
   - Located in `features/*/data/`

### Key Components

1. **Dependency Injection (GetIt)**
   - Centralized in `core/di/injection_container.dart`
   - Manages all dependencies
   - Provides singleton instances
   - Easy to test and maintain

2. **State Management (Riverpod)**
   - Providers for state management
   - Async state handling
   - Error handling
   - Loading states

3. **API Integration**
   - REST API communication
   - JSON parsing
   - Error handling
   - Data models

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/api_demo.git
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   - Create a new Firebase project
   - Add Android/iOS apps
   - Download and add configuration files:
     - Android: `google-services.json` in `android/app/`
     - iOS: `GoogleService-Info.plist` in `ios/Runner/`

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Features Implementation

### Posts Feature

1. **Data Flow**
   - UI triggers state change
   - Provider calls use case
   - Use case calls repository
   - Repository fetches data from API
   - Data flows back up through the layers

2. **Error Handling**
   - API errors
   - Network errors
   - UI error states
   - Crashlytics integration

3. **State Management**
   - Loading states
   - Error states
   - Success states
   - Data caching

## 🧪 Testing

The project structure supports easy testing:

- Unit tests for use cases
- Repository tests
- Data source tests
- Widget tests for UI
- Integration tests

## 📝 Code Style

- Follows Flutter style guide
- Clean Architecture principles
- SOLID principles
- Dependency injection
- Separation of concerns

## 🔄 Future Improvements

- Add local caching
- Implement more features
- Add authentication
- Enhance error handling
- Add more unit tests
- Implement CI/CD


## 👥 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
