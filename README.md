# 🛒 eCommerce Apple Tech

> Apple Tech - app with a catalog of Apple products, a shopping cart, favorites, and push notifications.

---

## 🎥 Demo

<img src="assets/demo.gif" width="300"/>

---

## ✨ Features

* 🔐 Authentication (Email)
* 🛍️ Product catalogs
* ❤️ Wishlist
* 🛒 Cart

Planned:
* 💳 Checkout (mock)
* 🌙 Dark mode
* 🌍 Localization (если есть)
* 🔎 Search and filtering

---

## 🧰 Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Cubit
* **Navigation:** Go router
* **DI:** GetIt
* **Backend:** Firebase
* **Database:** Firestore
* **Architecture:** Clean Architecture

---

## 🏗 Architecture

The project was built using **Clean Architecture(features first)** :

```bash
lib/
 ├── core/           # common utilities, themes, constants, di, router
 ├── features/       # auth, cart, product...
 ├── apple_tech_app.dart 
 └── main.dart 
```

---

## 🚀 Getting Started

### 1. Clone

```bash
git clone https://github.com/VladIsLuv-N/ecommerce-apple-tech.git
cd your-repo
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run project

```bash
flutter run
```

---

