# Third Places App 🌳

Third Places is a mobile application designed to help users discover and engage with local parks and green spaces. The app aims to increase accessibility to public spaces and foster community engagement through shared outdoor experiences.

## Project Overview

### Mission

To create an intuitive platform that connects people with local green spaces and builds community through shared outdoor experiences.

### Target Audience

- Primary: Young adults in the Bay Area looking to discover new parks
- Secondary: Community event organizers and local park enthusiasts
- Future: Broader age groups and geographic regions

## Features

### Phase 1 (MVP)

- 🔐 User Authentication
  - Email/password login
  - Google Sign-In
  - Apple Sign-In
  - Profile management
- 🗺️ Park Discovery
  - List and map views of nearby parks
  - Detailed park information
  - Distance-based filtering
  - Park search functionality
  - Save favorite parks
- 📅 Community Events
  - Browse local park events
  - Event details and registration
  - Save events to device calendar

### Phase 2 (Planned)

- Advanced park filtering by amenities
- User-created events
- Social features and friend system
- Tree Tokens reward system
- Offline support
- Park reviews and ratings

## Setup Instructions

### Prerequisites

1. **Flutter Setup**

   - Install Flutter by following the [official installation guide](https://docs.flutter.dev/get-started/install)
   - Run `flutter doctor` to verify your installation
   - Minimum Flutter version: 3.5.3
   - Required dependencies are listed in `pubspec.yaml`

2. **Development Environment**

   - Install [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
   - Install Flutter and Dart plugins for your IDE
   - For iOS development:
     - Mac computer with Xcode installed
     - iOS Simulator or physical iOS device
     - [CocoaPods](https://cocoapods.org/) installed

3. **Firebase Setup**
   - Create a [Firebase account](https://firebase.google.com/)
   - Install Firebase CLI: `npm install -g firebase-tools`
   - Login to Firebase: `firebase login`
   - Create a new Firebase project
   - Enable Authentication (Email/Password, Google, Apple Sign-In)
   - Set up Cloud Firestore
   - Follow the [FlutterFire installation guide](https://firebase.flutter.dev/docs/overview/)

### Project Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-org/third-places.git
   cd third-places
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**

   - Download `GoogleService-Info.plist` from Firebase Console
   - Place it in `ios/Runner`
   - Update Firebase configuration in `lib/firebase/firebase_options.dart`

4. **iOS Setup**

   ```bash
   cd ios
   pod install
   cd ..
   ```

5. **Run the App**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── assets/          # Custom widgets and UI components
├── firebase/        # Firebase configuration and services
├── models/          # Data models
├── providers/       # Riverpod state management
├── screens/         # App screens
├── theme/          # App theming
├── util/           # Utility functions
└── widgets/        # Reusable widgets
```

## Development Guidelines

### State Management

- Use Riverpod for state management
- Create providers in the `providers/` directory
- Follow the provider naming convention: `*Provider`

### Code Style

- Follow the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
- Use meaningful variable and function names
- Add comments for complex logic
- Implement proper error handling

### Testing

- Write unit tests for business logic
- Create widget tests for UI components
- Test critical user flows
- Run tests before submitting PRs:
  ```bash
  flutter test
  ```

### Git Workflow

1. Create feature branch from `develop`
2. Make changes and test locally
3. Submit PR for review
4. Merge to `develop` after approval

## Troubleshooting

### Common Issues

1. **Firebase Configuration**

   - Verify `GoogleService-Info.plist` is in the correct location
   - Check Firebase configuration in `firebase_options.dart`

2. **iOS Build Issues**

   - Clean build: `flutter clean`
   - Update pods: `cd ios && pod update`
   - Verify minimum iOS version in `Podfile`

3. **Location Services**
   - Enable location permissions in iOS settings
   - Check location permission handling in code

### Getting Help

- Check the [Flutter documentation](https://docs.flutter.dev/)
- Review the [Firebase Flutter documentation](https://firebase.flutter.dev/docs/overview/)
- Ask questions in the project's Slack channel
- Create an issue in the repository

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
5. Wait for review and approval

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, contact the development team at [team@thirdplaces.com](mailto:team@thirdplaces.com)
