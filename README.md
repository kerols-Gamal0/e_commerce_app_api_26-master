# 🛒 E-Commerce App

A modern, scalable E-Commerce mobile application built with Flutter following **Clean Architecture** and **Feature-First** structural pattern. The app integrates with a RESTful API to manage products, categories, favorites, and cart management seamlessly.

---

## 🚀 Features

* **Authentication (`auth`):** Complete user authentication flow (Sign In, Sign Up, Token validation).
* **Home Screen (`home`):** Dynamic product feed, live product grid, and interactive search functionality.
* **Categories (`categories`):** Browse products categorized smoothly with custom filter grids.
* **Favorites (`favorites`):** Real-time persistent dynamic favorite system synced across multiple screens.
* **Cart Management (`cart`):** Fully operational shopping cart to add, remove, and update quantities dynamically.
* **Profile (`profile`):** User dashboard and local session management.

---

## 🛠️ Tech Stack & Architecture

* **Framework:** Flutter (Dart)
* **State Management:** Provider / MultiProvider (for scalable real-time state synchronization)
* **Architecture:** Clean Architecture + Feature-First Approach (`data` vs `presentation` decoupling)
* **Local Storage:** Secure Cache/Preferences Helper for Token persistence

---

## 📁 Project Structure (`lib/`)

The project follows a modular structure where each feature is isolated:

```text
lib/
├── core/                   # Shared utilities, app themes, storage helpers
└── features/               # Independent business modules
    ├── auth/               # Login & Registration module
    ├── cart/               # Cart logic & state management
    ├── categories/         # Product Category modules
    ├── home/               # Dashboard, API integration & Product Cards
    ├── favorites/          # Real-time bookmarking logic
    ├── main_wrapper/       # Persistent bottom navigation handling
    └── profile/            # User account settings
