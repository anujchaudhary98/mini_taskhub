 Mini TaskHub – Personal Task Tracker App
Mini TaskHub is a clean and simple Flutter application built as part of an internship assignment. It helps users manage their daily tasks with login authentication and task storage powered by Supabase.

🔧 Features
✅ Email & Password Authentication using Supabase

📋 Task Dashboard (Pending / Completed)

➕ Add New Task (via Dialog)

❌ Delete Task

🌐 Supabase Database Integration

🎨 Responsive UI based on Figma design

🗂️ Clean folder structure with state management (Provider or Riverpod)

✨ Light theming and minimal animations

📱 Screens
Login / Signup Screen

Register or Login with email & password

Redirect to Dashboard if authenticated

Dashboard Screen

View list of tasks

Add/Delete tasks

Optional: mark tasks as completed

🛠️ Tech Stack
Flutter (3.x)

Dart

Supabase (Auth + Realtime Database)

Riverpod / Provider (State Management)

Figma (for UI reference)

🧰 How to Run
Clone the repo

bash
Copy
Edit
git clone https://github.com/anujchaudhary98/mini_taskhub.git
cd mini_taskhub
Add your Supabase credentials in lib/constants.dart

dart
Copy
Edit
const String supabaseUrl = 'https://xyz.supabase.co';
const String supabaseAnonKey = 'your-anon-key';
Install dependencies

bash
Copy
Edit
flutter pub get
Run the app

bash
Copy
Edit
flutter run
🛑 Supabase DB Setup
Create table tasks with columns:

id: uuid (Primary Key)

title: text

is_completed: boolean

user_id: uuid (foreign key to auth.users)
