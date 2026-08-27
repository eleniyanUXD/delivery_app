# ExpressFeast Food Delivery App

A Flutter-based food delivery mobile application built as a learning and portfolio project to practice mobile app development, UI/UX implementation, Firebase integration, API integration, and real-world application architecture.

The app allows users to discover food, search for dishes, manage favorites, add items to a cart, select a delivery address, proceed through checkout, and track their orders.

## Features

### Authentication

- User sign up
- User login
- Firebase Authentication
- Form validation
- Loading and error states

### Home

- Featured restaurants
- Popular dishes
- Food categories
- Promotional banners
- Restaurant and dish cards

### Search

- Search for food
- Search for restaurants
- Display search results
- Browse available dishes

### Food Categories

- Shawarma
- Pizza
- Jollof Rice
- Drinks
- Other food categories

### Favorites

* Add dishes to favorites
* Remove dishes from favorites
* Add restaurants to favorites
* Separate food and restaurant favorites

### Cart

- Add items to cart
- Increase item quantity
- Decrease item quantity
- Remove items from cart
- Automatic total calculation

### Checkout & Payment

- Order summary
- Payment method selection
- Card payment interface
- Card information input
- Order confirmation
- Card scanner

### Delivery Address

- Search for an address
- Select a delivery location
- Display the selected location on a map
- OpenStreetMap integration

### Order Tracking

- View order status
- Track delivery progress
- Display different stages of the delivery process

### Profile

- View profile information
- Edit profile information
- Account settings
- General settings

## Screenshots

### Onboarding

### Home

### Search

### Favorites

### Cart

### Checkout

### Delivery Address

### Profile

### Order Tracking

## Tech Stack

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Flutter Map
- OpenStreetMap
- Shared Preferences

## Packages

Some of the major packages used in the project include:

- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `firebase_storage`
- `google_sign_in`
- `flutter_map`
- `latlong2`
- `shared_preferences`
- `google_fonts`
- `flutter_svg`
- `carousel_slider`
- `image_picker`
- `file_picker`
- `http`
- `flutter_credit_card`

## Project Structure

```text
lib/
│
├── models/
│
├── screens/
│
├── widgets/
│
├── services/
│
├── data/
│
├── firebase_options.dart
│
└── main.dart

screenshots/
├── onboarding.png
├── home_screen.png
├── profile_screen.png
├── favorite_screen.png
├── cart_screen.png
├── checkout_screen.png
├── chat_screen.png
└── order_tracking.png
```

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android emulator or physical Android device
- Firebase project

### Clone the Repository

```bash
git clone https://github.com/eleniyanUXD/delivery_app.git
```

### Navigate to the Project

```bash
cd delivery_app
```

### Install Dependencies

```bash
flutter pub get
```

### Configure Firebase

Configure Firebase using FlutterFire:

```bash
flutterfire configure
```

Make sure the required Firebase services are enabled:
- Firebase Authentication
- Cloud Firestore
- Firebase Storage

### Run the Application

```bash
flutter run
```

## Build APK

To generate a release APK:

```bash
flutter build apk --release
```

The generated APK will be available at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## User Flow

```text
Onboarding
     ↓
Sign Up / Sign In
     ↓
Home
     ↓
Browse Food / Search
     ↓
Select Food
     ↓
Add to Cart
     ↓
Checkout
     ↓
Payment
     ↓
Select Delivery Address
     ↓
Order Confirmation
     ↓
Track Order
```

## What I Learned

Building this project helped me improve my understanding of:

- Flutter and Dart
- Mobile UI development
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- API integration
- Map integration
- State management using `setState`
- Reusable Flutter widgets
- Form validation
- Navigation and routing
- Local data persistence
- Building complete mobile application flows
- Translating UI/UX designs into functional Flutter interfaces

## Future Improvements

- Real-time order tracking
- Restaurant-side dashboard
- Delivery rider application
- Real online payment integration
- Push notifications
- Food ratings and reviews
- Restaurant ratings and reviews
- Order history
- Promo codes and discounts
- Advanced food filtering
- Improved search and recommendations
- User location detection
- Restaurant location discovery

## Author

### Fuad Abdulrauf

UX Designer & Flutter Mobile App Developer

This project was built to strengthen my Flutter development skills while combining my UX design background with mobile application development.

## License

This project was created for learning, portfolio, and demonstration purposes.
