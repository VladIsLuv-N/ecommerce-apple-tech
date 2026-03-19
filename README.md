# 🛒 Flutter eCommerce App

> Полноценное eCommerce-приложение с каталогом товаров, корзиной и оформлением заказа.

---

## 📱 Screenshots

| Home | Product | Cart | Checkout |
| ---- | ------- | ---- | -------- |
|      |         |      |          |

---

## 🎥 Demo

* 📦 APK: [Download](#)
* 🎬 Video: [Watch Demo](#)

---

## ✨ Features

* 🔐 Authentication (Email / Google / Firebase)
* 🛍️ Каталог товаров
* 🔎 Поиск и фильтрация
* ❤️ Wishlist
* 🛒 Корзина
* 💳 Checkout (mock / Stripe)
* 🌙 Dark mode
* 🌍 Localization (если есть)

---

## 🧰 Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Bloc / Riverpod / Provider
* **Backend:** Firebase / REST API
* **Database:** Firestore / SQLite / Hive
* **Architecture:** Clean Architecture

---

## 🏗 Architecture

Проект построен с использованием **Clean Architecture** и разделён на слои:

```bash
lib/
 ├── core/           # общие утилиты, темы, константы
 ├── features/       # фичи (auth, cart, product)
 ├── data/           # API, модели, репозитории
 ├── domain/         # бизнес-логика (если есть)
 └── presentation/   # UI (screens, widgets)
```

---

## 🚀 Getting Started

### 1. Клонировать репозиторий

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### 2. Установить зависимости

```bash
flutter pub get
```

### 3. Запустить проект

```bash
flutter run
```

---

## 🔐 Environment Variables

Создай `.env` файл в корне проекта:

```env
API_URL=your_api_url
API_KEY=your_api_key
```

---

## 🧪 Tests

```bash
flutter test
```

Примеры тестов:

* Business logic (Bloc / UseCases)
* API layer
* Widget tests

---

## 💡 Challenges & Solutions

### 🚧 Challenges

* Медленная загрузка списка товаров
* Управление состоянием корзины
* Работа с асинхронными API

### ✅ Solutions

* Pagination + lazy loading
* Использование Bloc/Riverpod
* Repository pattern + caching

---

## 📦 Build APK

```bash
flutter build apk
```

---

## 🗺 Roadmap

* [ ] Добавить оплату (Stripe / PayPal)
* [ ] Улучшить UI/UX
* [ ] Добавить push-уведомления
* [ ] Offline mode

---

## 🤝 Contributing

Pull requests приветствуются. Для серьёзных изменений сначала открой issue.

---

## 📄 License

MIT License

---

## 👨‍💻 Author

* GitHub: https://github.com/your-username
* LinkedIn: https://linkedin.com/in/your-profile

---
