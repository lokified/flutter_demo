# mentali

This is a collection of flutter practice apps.

## Movie App

A Flutter application that allows users to discover movies, view trending and popular titles, and manage their favorite movies collection.

## Features

- Browse popular and trending movies
- Infinite scroll pagination for smooth browsing experience
- Save movies to favorites
- Remove movies from favorites
- View detailed movie information
- Search functionality
- Offline support for favorite movies

## Prerequisites

Before running this application, make sure you have the following installed:
- Flutter SDK (version 3.0 or higher)
- Dart SDK (version 2.17 or higher)
- Android Studio / VS Code with Flutter plugins

## Installation

1. Clone the repository:
```bash
git clone https://github.com/lokified/flutter_demo.git
cd flutter_demo
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Architecture

This app follows a clean architecture pattern with BLoC for state management:

```
lib/
  ├── data/
  │   ├── datasources/
  │   ├── models/
  │   └── repositories/
  ├── domain/
  │   ├── entities/
  │   └── repositories/
  ├── presentation/
  │   ├── blocs/
  │   ├── screens/
  │   └── widgets/
  └── core/
      ├── constants/
      └── utils/
```

## Dependencies

The application uses the following major dependencies:

- **retrofit**: For type-safe HTTP client
- **floor**: SQLite database abstraction
- **get_it**: Dependency injection
- **dio**: HTTP client for API requests
- **bloc**: State management
- **infinite_scroll_pagination**: Handles pagination for movie lists

## API Integration

The app integrates with the TMDB (The Movie Database) API. Make sure to:

1. Sign up for a TMDB account
2. Get your API key

## State Management

The app uses BLoC pattern for state management. Main BLoCs include:

- MovieBloc: Handles movie listing and pagination
- FavoriteBloc: Manages favorite movies operations
- SearchBloc: Handles movie search functionality

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Contact

Email - lsheldon645@gmail.com
=======
A Flutter project with diffferent demo apps for practice

>>>>>>> 89dc7ea9c31f17fd524cb9b2902cf7aacc2e03ce
