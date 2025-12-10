
# Flutter Wallpaper App
A clean, modern, and lightweight Flutter Wallpaper App that lets users browse, favorite, download, and share high-quality wallpapers.
The app loads wallpapers dynamically from a JSON file and features smooth transitions, caching, and offline-friendly behavior.

## Features
- Browse wallpapers in a beautiful grid layout
- Full-screen wallpaper detail view
- Favorite wallpapers with toggle support
- Download wallpapers directly to device gallery
- Share wallpaper links using the system share sheet
- Hero animations for smooth transitions
- JSON-based wallpaper loading for easy updates

## Screenshots






## Getting Started

### Prerequisites
- Flutter SDK
- Android Studio or VS Code
- A device or emulator

### Installation
1. Clone the repository:
   git clone https://github.com/yourusername/flutter_wallpaper_app.git
2. Navigate to the project folder:
   cd flutter_wallpaper_app
3. Install dependencies:
   flutter pub get
4. Run the app:
   flutter run

## Folder Structure
```plaintext
lib/
 ├─ main.dart
 ├─ model/
 ├─ screens/
 ├─ services/
assets/
 └─ wallpaper.json
```

## Dependencies
- cached_network_image
- dio
- path_provider
- share_plus

## JSON Structure
```plaintext
[
  {"id": 1, "name": "Sunset", "url": "https://example.com/sunset.jpg"},
  {"id": 2, "name": "Mountains", "url": "https://example.com/mountains.jpg"}
]
```


