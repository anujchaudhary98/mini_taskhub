# Mini TaskHub (Final Version)

A full-featured task tracking app using Flutter and Supabase.

## Features
- Email/password login via Supabase
- Add, view, and delete tasks
- Responsive UI, clean structure

## Setup
1. Replace Supabase `url` and `anonKey` in `main.dart`
2. Run `flutter pub get`
3. Create a table `tasks` with fields: id (uuid), title (text), is_completed (bool), user_id (uuid)
4. Run app using `flutter run`
