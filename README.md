# ParkEase Plus 🚗

**ParkEase Plus** is a mobile application built with Flutter designed to streamline and organize parking within college campuses. It eliminates the chaos of finding parking spots by providing a digital booking and management system for students, faculty, and visitors.

## 📱 Project Overview

**Problem:** Parking in college campuses is often chaotic, unorganized, and time-consuming, leading to congestion and frustration.
**Solution:** ParkEase Plus offers a user-friendly platform to view available slots, book parking in advance, and navigate to specific parking areas seamlessly.

## ✨ Features

* **User Authentication:** Secure login and registration using Email/Password and **Google Sign-In**.
* **Interactive Maps:** View parking locations within the campus using **Google Maps**.
* **Real-time Booking:** detailed parking slot selection to reserve a spot.
* **Booking Management:** Track **Ongoing**, **Completed**, and **Canceled** bookings.
* **Vehicle Management:** Add and manage multiple vehicles for easy booking.
* **Secure Payments:** Integrated **Razorpay** for cashless parking fee transactions.
* **Navigation:** Get directions to the selected parking spot.
* **Profile Management:** Manage user details and account settings.

## 🛠️ Tech Stack & Dependencies

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** Dart
* **State Management:** [GetX](https://pub.dev/packages/get)
* **Backend & Auth:** [Firebase](https://firebase.google.com/) (Auth, Firestore, Realtime Database, Storage)
* **Maps:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter) & [Geolocator](https://pub.dev/packages/geolocator)
* **Payments:** [Razorpay](https://razorpay.com/docs/flutter/)
* **UI/UX:**
    * `lottie` (Animations)
    * `flutter_svg` (SVG support)
    * `iconsax` & `cupertino_icons` (Icon packs)
    * `smooth_page_indicator` (Onboarding UI)

## 📂 Project Structure

```text
lib/
├── components/         # Reusable UI widgets (Buttons, TextFields, Parking Slots)
├── config/             # App configuration (Colors, Routes, Themes)
├── controller/         # GetX Controllers for business logic
├── pages/              # UI Screens
│   ├── about_us/       # About Us page
│   ├── booking/        # Booking logic and history tabs
│   ├── homepage/       # Main dashboard
│   ├── login_screen/   # Authentication screens
│   ├── onboarding_screen/ # Intro screens
│   ├── profile_page/   # User settings
│   └── signup_screen/  # Registration
├── utils/              # Helper functions and constants
└── main.dart           # Application entry point
