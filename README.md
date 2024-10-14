# 🃏 Flutter Card-Matching Game 🎮

A **Flutter-based card-matching game** with smooth animations, state management, a timer, and a scoring system. Players are presented with a **4x4 grid** of cards and must flip them to find matching pairs. The game tracks the score and time taken to match all pairs.


<img src="https://github.com/SamiAhmed007/Flutter-Card-Matching-Game/blob/main/assets/Home.jpeg" width="400">

## ✨ Features
- 🎯 **4x4 Grid**: A grid with 8 unique pairs of images.
- 🌀 **Smooth Animations**: Cards flip over with a smooth animation.
- 🧠 **Matching Logic**: Cards stay flipped if they match, otherwise flip back.
- ⏱️ **Timer**: Tracks the time taken to match all pairs.
- 🏆 **Scoring System**: Points are awarded for matching pairs and deducted for mismatches.
- 🎉 **Game Over Screen**: Displays a "You Win!" message when all pairs are matched.
- 🔁 **Restart Button**: Allows players to restart the game at any point.

## 📸 Screenshots
<div>
  <img src="https://github.com/SamiAhmed007/Flutter-Card-Matching-Game/blob/main/assets/Game_start.jpeg" width="300">
  <img src="https://github.com/SamiAhmed007/Flutter-Card-Matching-Game/blob/main/assets/Game_play.jpeg" width="300">
  <img src="https://github.com/SamiAhmed007/Flutter-Card-Matching-Game/blob/main/assets/Game_finish.jpeg" width="300">
</div>

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- 📱 [Flutter](https://flutter.dev/docs/get-started/install) (Make sure you have Flutter installed and set up correctly)
- An emulator or a physical device for testing

### 🔧 Installing

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/flutter-card-matching-game.git
   cd flutter-card-matching-game

2. **Install dependencies**:
    ```bash
    flutter pub get
    
3. **Run the app**:
    ```bash
    flutter run

## 🎮 How to Play
- Tap on any card to flip it.
- Flip another card to see if it matches the first one.
- If they match, the cards will stay face-up.
- If they don’t match, both cards will flip back after a short delay.
- The goal is to match all pairs of cards as quickly as possible while minimizing mismatches.

## 🏅 Game Rules
- Each matched pair adds +10 points. 🟢
- Each mismatched pair deducts -5 points. 🔴
- The timer starts as soon as the game begins and stops when all pairs are matched.
- Try to achieve the highest score by matching pairs quickly and accurately.

## 🗂 Project Structure
    lib/
    │
    ├── models/
    │   └── card_model.dart         # Data model for individual cards
    │
    ├── providers/
    │   └── game_state.dart         # Game logic and state management
    │
    ├── widgets/
    │   └── card_grid.dart          # UI widget to display the grid of cards
    │
    ├── main.dart                   # App entry point
    ├── assets/                     # Image assets used in the game
    └── pubspec.yaml                # Flutter configuration and dependencies

## 🔨 Built With
- Flutter - Framework for building natively compiled applications for mobile, web, and desktop from a single codebase
- Provider - State management package

## 🙏 Acknowledgments
- Images used for cards were sourced from [your_image_source_link].
- Thanks to the Flutter community for their awesome tools and documentation!

