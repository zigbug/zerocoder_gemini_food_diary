# zerocoder_gemini_food_diary

**Food Diary** — дневник питания на Flutter с авторизацией Firebase, учётом БЖУ
и помощником на базе Google Gemini (голосовой ввод + запросы к модели).

A Flutter food diary with Firebase auth, macro tracking and a Google Gemini
assistant (voice input + model prompts).

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)

> Пакет в `pubspec.yaml` называется `gemeni_food_diary` — историческое имя проекта.
> The package is still named `gemeni_food_diary` in `pubspec.yaml`.

---

## 🇷🇺 Русский

### Описание

Дневник питания: вы записываете, что съели за день, видите прогресс по калорийности
и БЖУ, просматриваете историю и профиль. Распознавать блюда помогает Gemini —
кнопка «+» внизу запускает **голосовой ввод** (`voice_to_text`) и открывает диалог
с запросом к модели.

Проект в стадии разработки: авторизация, Firestore и диалог Gemini работают,
часть виджетов (прогресс дня, цели) пока использует заглушки.

### Возможности

- **Авторизация**: email + пароль и Google Sign-In (Firebase Auth), регистрация
- **Дневник в Firestore**: потоковая загрузка коллекции `myfood` на вкладке «День»
- **Голосовой ввод**: `voice_to_text` передаёт распознанную речь в диалог Gemini
- **Диалог Gemini**: произвольные запросы к модели прямо из приложения
  (`flutter_gemini`)
- Вкладки: **День** (прогресс калорий/БЖУ + список съеденного), **История**,
  **Цели**, **Профиль** (пол, имя, возраст, вес, рост)
- Модели данных: `FoodUnit` (блюдо, время, белки/жиры/углеводы, калории),
  `DayProgressData` (прогресс по К.кал, Б, Ж, У, воде)
- Обёртка `FirestoreService` с CRUD-операциями для коллекций/документов
- Светлая тема на `ColorScheme.fromSeed`, Material 3

### Технологии

- **Flutter**, Dart 3.4+
- [firebase_core](https://pub.dev/packages/firebase_core), [firebase_auth](https://pub.dev/packages/firebase_auth),
  [cloud_firestore](https://pub.dev/packages/cloud_firestore), [google_sign_in](https://pub.dev/packages/google_sign_in)
- [flutter_gemini](https://pub.dev/packages/flutter_gemini) — доступ к Google Gemini
- [voice_to_text](https://pub.dev/packages/voice_to_text) — распознавание речи
- [intl](https://pub.dev/packages/intl)

### Структура проекта

```
zerocoder_gemini_food_diary/
├── lib/
│   ├── main.dart                  # Gemini.init(apiKey), Firebase.initializeApp
│   ├── firebase_options.dart
│   ├── pages/                     # login, register, home, work (основной экран)
│   ├── models/                    # FoodUnit, DayProgressData
│   ├── services/
│   │   ├── auth_service.dart
│   │   └── cloud_firestore_serice.dart  # CRUD-обёртка над Firestore
│   └── widgets/                   # вкладки дня/истории/целей/профиля, GeminiDialog
├── LICENSE                        # GPL-3.0
└── pubspec.yaml
```

### Запуск

1. Создайте проект Firebase (Auth + Firestore) и подставьте свои конфиги
   в `lib/firebase_options.dart` (`flutterfire configure`).
2. Укажите свой ключ Gemini API в `lib/main.dart` (`Gemini.init(apiKey: ...)`).
   **Не коммитьте ключ в репозиторий** — используйте локальную подстановку
   или секреты CI.
3. Соберите:

```bash
flutter pub get
flutter run
```

---

## 🇬🇧 English

### Overview

A food diary: log what you ate, see calorie and macro progress for the day, browse
history and your profile. Gemini helps recognizing meals — the bottom «+» button
starts **voice input** (`voice_to_text`) and opens a prompt dialog with the model.

The project is a work in progress: auth, Firestore and the Gemini dialog work,
some widgets (day progress, goals) are still stubs.

### Features

- **Auth**: email + password and Google Sign-In (Firebase Auth), registration
- **Diary in Firestore**: live stream of the `myfood` collection on the «Day» tab
- **Voice input**: `voice_to_text` feeds recognized speech into the Gemini dialog
- **Gemini dialog**: arbitrary model prompts from inside the app (`flutter_gemini`)
- Tabs: **Day** (calorie/macro progress + eaten list), **History**, **Goals**,
  **Profile** (gender, name, age, weight, height)
- Data models: `FoodUnit` (dish, time, protein/fat/carbs, calories),
  `DayProgressData` (calories/protein/fat/carbs/water progress)
- `FirestoreService` CRUD wrapper over collections/documents
- Seeded light theme, Material 3

### Tech stack

- **Flutter**, Dart 3.4+
- [firebase_core](https://pub.dev/packages/firebase_core), [firebase_auth](https://pub.dev/packages/firebase_auth),
  [cloud_firestore](https://pub.dev/packages/cloud_firestore), [google_sign_in](https://pub.dev/packages/google_sign_in)
- [flutter_gemini](https://pub.dev/packages/flutter_gemini) — Google Gemini access
- [voice_to_text](https://pub.dev/packages/voice_to_text) — speech recognition
- [intl](https://pub.dev/packages/intl)

### Project structure

```
zerocoder_gemini_food_diary/
├── lib/
│   ├── main.dart                  # Gemini.init(apiKey), Firebase.initializeApp
│   ├── firebase_options.dart
│   ├── pages/                     # login, register, home, work (main screen)
│   ├── models/                    # FoodUnit, DayProgressData
│   ├── services/
│   │   ├── auth_service.dart
│   │   └── cloud_firestore_serice.dart  # Firestore CRUD wrapper
│   └── widgets/                   # day/history/goals/profile tabs, GeminiDialog
├── LICENSE                        # GPL-3.0
└── pubspec.yaml
```

### Getting started

1. Create a Firebase project (Auth + Firestore) and put your config into
   `lib/firebase_options.dart` (`flutterfire configure`).
2. Set your own Gemini API key in `lib/main.dart` (`Gemini.init(apiKey: ...)`).
   **Never commit the key** — inject it locally or through CI secrets.
3. Build:

```bash
flutter pub get
flutter run
```
