# Restaurant App using Flutter

A **feature-rich** restaurant and food ordering application built with Flutter and Dart, designed to provide a seamless dining and delivery experience with an elegant UI, smooth animations, and robust cross-platform functionality.

## Features

- Browse restaurant menu with categories (Appetizers, Main Courses, Desserts, Beverages, etc.).
- Detailed food item view with high-quality images, descriptions, ingredients, and pricing.
- Add items to cart with quantity selection and customization options.
- Real-time cart management (add, remove, update quantities).
- Order checkout with multiple payment options integration.
- Order tracking and status updates.
- User authentication (login/register) with profile management.
- Save favorite dishes and restaurants.
- Search and filter functionality for dishes and categories.
- Order history and reordering capability.
- Restaurant information (location, hours, contact details).
- Delivery and pickup options.
- Ratings and reviews system.
- Multi-platform support: Android, iOS, Web, Windows, macOS, and Linux.

> Note: Backend integration required for full functionality. Connect to your restaurant API or Firebase for live data.

## Project Structure

The project follows clean architecture principles with organized folders for better maintainability.

```text
restaurant_app/
├── lib/                # Dart source code
│   ├── screens/        # UI screens (home, menu, cart, checkout, profile)
│   ├── widgets/        # Reusable UI components (cards, buttons, etc.)
│   ├── models/         # Data models (MenuItem, Order, User, etc.)
│   ├── services/       # API services and business logic
│   ├── providers/      # State management (Provider/Riverpod/Bloc)
│   ├── utils/          # Helper functions, constants, themes
│   └── routes/         # Navigation and routing
├── assets/             # Images, fonts, and static resources
│   ├── images/         # Food images, logos, icons
│   └── fonts/          # Custom fonts
├── android/            # Android native project
├── ios/                # iOS native project
├── web/                # Web support
├── macos/              # macOS desktop support
├── linux/              # Linux desktop support
├── windows/            # Windows desktop support
├── test/               # Unit and widget tests
├── pubspec.yaml        # Dependencies and configuration
└── analysis_options.yaml
```

## Getting Started

### Prerequisites

- Flutter SDK installed (stable channel recommended)
- Android Studio or VS Code with Flutter and Dart extensions
- Android emulator, iOS simulator, or a physical device
- Backend API or Firebase project (optional for testing)

Verify your Flutter installation:

```bash
flutter doctor
```

### Installation

1. Clone the repository:

```bash
git clone https://github.com/HamoudAl-Jowlahi/Restaurant-App-using-Flutter.git
cd Restaurant-App-using-Flutter
```

2. Install dependencies:

```bash
flutter pub get
```

3. Configure Backend (if using):

   - Create a `.env` file in the root directory
   - Add your API configuration:
   
   ```
   API_BASE_URL=your_api_url_here
   API_KEY=your_api_key_here
   ```

4. Run the application:

```bash
# Android / iOS
flutter run

# Web
flutter run -d chrome

# Desktop (Windows/macOS/Linux)
flutter run -d windows  # or macos, linux
```

## Configuration

### Backend Integration

To connect with your restaurant backend:

1. Update API endpoints in `lib/services/api_service.dart`
2. Configure authentication methods
3. Set up payment gateway integration (Stripe, PayPal, etc.)
4. Implement order management system

### Firebase Setup (Alternative)

If using Firebase:

1. Create a Firebase project
2. Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
3. Enable Firebase Authentication
4. Set up Cloud Firestore for data storage
5. Configure Firebase Storage for images

### Customization

- **Theme**: Modify colors and styles in `lib/utils/theme.dart`
- **Menu Data**: Update menu items in `lib/models/menu_data.dart` or fetch from API
- **Assets**: Add food images to `assets/images/` and register in `pubspec.yaml`
- **Payment**: Configure payment gateways in `lib/services/payment_service.dart`

## Technologies Used

- **Flutter** - UI framework for cross-platform development
- **Dart** - Programming language
- **Provider/Riverpod/Bloc** - State management (configurable)
- **HTTP/Dio** - Network requests and API integration
- **Firebase** - Backend services (optional)
  - Authentication
  - Cloud Firestore
  - Cloud Storage
  - Cloud Functions
- **Shared Preferences** - Local data persistence
- **Cached Network Image** - Efficient image loading
- **Flutter SVG** - Vector graphics support
- **Google Maps/Location** - Restaurant location and delivery tracking
- **Flutter Rating Bar** - User ratings and reviews

## Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.0                    # State management
  http: ^1.1.0                        # HTTP requests
  dio: ^5.4.0                         # Advanced HTTP client
  firebase_core: ^2.24.0              # Firebase core
  firebase_auth: ^4.15.0              # Authentication
  cloud_firestore: ^4.13.0            # Database
  cached_network_image: ^3.3.0        # Image caching
  shared_preferences: ^2.2.2          # Local storage
  flutter_svg: ^2.0.9                 # SVG support
  google_maps_flutter: ^2.5.0         # Maps integration
  geolocator: ^10.1.0                 # Location services
  flutter_rating_bar: ^4.0.1          # Rating widget
  intl: ^0.18.1                       # Internationalization
  image_picker: ^1.0.5                # Image selection
  url_launcher: ^6.2.2                # External links
```

## Features in Detail

### User Authentication
- Email/password registration and login
- Social media authentication (Google, Facebook)
- Guest checkout option
- Password recovery
- Profile management

### Menu Management
- Category-based navigation
- Search and filter options
- Popular and recommended dishes
- Customizable options (size, toppings, spice level)
- Allergen and nutritional information

### Cart & Checkout
- Real-time cart updates
- Promo code application
- Multiple payment methods
- Delivery address management
- Order summary and confirmation

### Order Tracking
- Real-time order status updates
- Estimated delivery time
- Delivery driver tracking (if implemented)
- Order history
- Reorder functionality

## Screenshots

_Add screenshots of your app here to showcase the UI and features._

## Roadmap

Planned enhancements:

- Push notifications for order updates
- Loyalty points and rewards system
- Table reservation feature
- Live chat support
- Multi-language support (Arabic/English)
- Dark mode theme
- Voice ordering integration
- AR menu visualization
- Integration with restaurant POS systems
- Advanced analytics dashboard

## Testing

Run tests:

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter drive --target=test_driver/app.dart
```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes and commit: `git commit -m "Add your feature description"`
4. Push to your branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

## License

This project currently has **no explicit license** defined in the repository.
If you plan to make it open source, consider adding a `LICENSE` file (e.g., MIT, Apache-2.0).

## Contact

Created and maintained by **Hamoud Al-Jowlahi**

GitHub: [@HamoudAl-Jowlahi](https://github.com/HamoudAl-Jowlahi)

## Acknowledgments

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- Flutter community for packages and support
- Design inspiration from modern food delivery apps
