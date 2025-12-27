# ☕️ ChaiGPT

**Debug your mood with the perfect Chai & Snack pairing.**

ChaiGPT is a playful Flutter application that acts as your personal "Chai Sommelier". Whether you're stressed, happy, or heartbroken, ChaiGPT recommends the ideal comfort food combination to match your vibe.

## ✨ Features

*   **Mood-Based Recommendations**: Select from 5 distinct moods (Stressed, Rainy, Sleepy, Happy, Heartbroken).
*   **Curated Pairings**: Expertly matched Chai and Snacks (e.g., *Adrak Chai + Pakoras* for rainy days).
*   **Cozy Aesthetic**: A "Cozy Cafe" theme featuring `Colors.orange[50]` cream backgrounds and warm brown/saffron accents.
*   **Smooth Animations**: Powered by `flutter_animate` for delightful entrance effects.
*   **Modern Design**: Material 3 Design components including `ChoiceChip` and elevated `Cards`.

## 🛠️ Tech Stack

*   **Framework**: Flutter
*   **Language**: Dart
*   **Typography**: [Google Fonts (Poppins)](https://pub.dev/packages/google_fonts)
*   **Animations**: [flutter_animate](https://pub.dev/packages/flutter_animate)
*   **Icons**: Material Icons

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK installed
*   Dart SDK installed

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/YOUR_USERNAME/chaigpt.git
    ```
2.  Navigate to the project directory:
    ```bash
    cd chaigpt
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Configure Firebase (Required):
    > This app uses Firebase. You must link it to your own Firebase project.
    ```bash
    flutterfire configure
    ```
5.  Run the app:
    ```bash
    flutter run
    ```

## 🤖 The Prompt
This application was entirely generated using the following prompt:

> Act as a Senior Flutter Engineer specializing in Material 3 Design and Micro-Interactions.
> 
> Build a single-screen Flutter application called "ChaiGPT" in lib/main.dart.
> The app serves as a "Chai Sommelier," recommending the perfect Chai and Snack pairing based on the user's current mood.
> 
> Use flutter_animate for smooth entrance animations.
> Use google_fonts (Poppins) for typography.
> Use standard Material Icons.
> 
> Theme: "Cozy Cafe" aesthetic. Use a Colors.orange[50] background.
> Colors: Primary accent should be Colors.brown[700] (Chai color) and Colors.orange[800] (Saffron).
> Components: Use Material 3 ChoiceChip for moods and a large, elevated Card for the result.
> 
> Data & Logic (Hardcoded):
> 
> Create a list of Moods: "Stressed 😫", "Rainy 🌧️", "Sleepy 😴", "Happy 😊", "Heartbroken 💔".
> 
> Stressed: "Strong Masala Chai" + "Bun Maska". Reason: "Melt the pressure away."
> Rainy: "Adrak (Ginger) Chai" + "Hot Pakoras". Reason: "The ultimate monsoon combo."
> Sleepy: "Kadak Cutting Chai" + "Indori Poha". Reason: "Instant energy boost."
> Happy: "Elaichi Chai" + "Jalebi". Reason: "Sweet treats for good vibes."
> Heartbroken: "Tandoori Chai" + "Sutta (Just kidding, Maggie)". Reason: "Warmth for the cold heart."
> 
> UI Layout:
> Header: Large Title "☕️ ChaiGPT" with a subtitle "Debug your mood".
> Mood Section: A horizontal scrollable row of Chips.
> Recommendation Area: A centered container that displays the Chai Name (Large), Snack Name (Medium), and the "Why" (Italic).
> Animation: When a mood is selected, the Recommendation Card should fade in and slide up (.fadeIn().slideY()).

## 📄 License
This project is licensed under the MIT License.
