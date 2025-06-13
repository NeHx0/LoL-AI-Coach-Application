# 🏆 League of Legends AI Coach Application

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![League of Legends](https://img.shields.io/badge/League%20of%20Legends-C89B3C?style=for-the-badge&logo=riotgames&logoColor=white)

**Modern AI-powered League of Legends coaching application**

[📱 Download](#installation) • [🎮 Features](#features) • [📖 Usage](#usage-guide) • [🚀 Getting Started](#getting-started)

</div>

---

## 📋 Table of Contents

- [🎯 About the Project](#-about-the-project)
- [✨ Features](#-features)
- [📱 Screenshots](#-screenshots)
- [🚀 Getting Started](#-getting-started)
- [📖 Usage Guide](#-usage-guide)
- [🛠️ Installation](#️-installation)
- [🎮 Champion Guide](#-champion-guide)
- [⭐ Favorites System](#-favorites-system)
- [🔧 Technical Details](#-technical-details)
- [🤝 Contributing](#-contributing)

---

## 🎯 About the Project

**LoL AI Coach** is a modern mobile application developed for League of Legends players. Integrated with Riot Games API, it provides real-time champion statistics, professional build guides, and AI-powered champion recommendations.

### 🎪 What It Does?

- 🏅 **Personalized Champion Recommendations** - Champions suited to your playstyle
- 📊 **Real-Time Statistics** - Win rate, pick rate, ban rate analytics
- 🛠️ **Professional Build Guides** - Pro player build rotations
- 🔮 **Optimized Rune Pages** - Meta-compliant rune sets
- 📚 **Detailed Champion Guides** - Combos, counters, tips & tricks
- ⭐ **Favorites System** - Save and manage your favorite champions

---

## ✨ Features

### 🎮 **Champion Management**
- **67 Champions** with detailed information
- Role-based filtering *(Top, Jungle, Mid, ADC, Support)*
- Search and discovery system
- Difficulty level indicators *(Easy, Medium, Hard)*

### 📊 **Statistical Analysis**
- Current **Win Rate** data
- **Pick Rate** and **Ban Rate** metrics
- Champion popularity trends
- Meta analysis and recommendations

### 🛠️ **Build System**
- **Core Items** - Main build rotation
- **Boots Options** - Situation-specific footwear
- **Situational Items** - Matchup-based items
- **Starting Items** - Optimal opening builds
- **Skill Order** - Ability leveling sequence

### 🔮 **Rune System**
- **Primary/Secondary Trees** - Optimal rune combinations
- **Stat Shards** - Bonus statistics
- **Strategy Descriptions** - Rune synergy explanations
- **Meta-compliant** - Updated for current patch

### 📚 **Champion Guides**
- **Laning Phase** strategies
- **Team Fighting** positioning
- **Combos & Mechanics** - Skill combinations
- **Tips & Tricks** - Pro player insights
- **Counter Matchups** - Difficult opponents
- **Team Synergies** - Best teammates

---

## 📱 Screenshots

![image](https://github.com/user-attachments/assets/0ffdb0ed-79d5-4e50-8858-d8152535045f)
![image](https://github.com/user-attachments/assets/99946f22-ad16-4688-a816-a4f8b2c1e2ab)
![image](https://github.com/user-attachments/assets/909e54b6-0f2e-4e60-a4cb-a75dc30b67e0)
![image](https://github.com/user-attachments/assets/752447b3-7447-42c1-9d74-2214104d2076)
![image](https://github.com/user-attachments/assets/946d95ed-dec1-4160-b9f2-5512398745e9)
![image](https://github.com/user-attachments/assets/f57f8192-a8f0-4e50-bd1d-2cc8286f765e)

---

## 🚀 Getting Started

### 📋 Prerequisites

Before running the application, make sure you have:

- **Flutter SDK** (3.0.0 or higher)
- **Dart SDK** (2.17.0 or higher)
- **Android Studio** or **VS Code** with Flutter extension
- **Git** for version control

### 🔑 API Setup

1. **Get Riot API Key:**
   ```bash
   # Visit: https://developer.riotgames.com/
   # Sign in with your Riot account
   # Generate a new API key
   ```

2. **Configure API Key:**
   ```dart
   // In lib/api_service.dart
   static const String apiKey = 'YOUR_RIOT_API_KEY_HERE';
   ```

---

## 🛠️ Installation

### 📱 **Method 1: Clone Repository**

```bash
# Clone the repository
git clone https://github.com/yourusername/LoL-AI-Coach-Application.git

# Navigate to project directory
cd LoL-AI-Coach-Application

# Install dependencies
flutter pub get

# Run the application
flutter run
```

### 📦 **Method 2: Download Release**

1. Go to [Releases](https://github.com/yourusername/LoL-AI-Coach-Application/releases)
2. Download the latest APK file
3. Install on your Android device
4. Open and enjoy!

---

## 📖 Usage Guide

### 🏠 **Home Screen**
- **Champion Recommendations** - Get personalized suggestions
- **Lane Selection** - Choose your preferred role
- **Random Pick** - Let AI suggest a champion for you
- **Statistics Overview** - View app metrics

### 🔍 **Champion Discovery**
1. **Browse All Champions** - Explore the complete roster
2. **Filter by Role** - Top, Jungle, Mid, ADC, Support
3. **Search Function** - Find champions by name
4. **Difficulty Filter** - Easy, Medium, Hard

### 📊 **Champion Details**
- **Statistics Card** - Win/Pick/Ban rates
- **Build Guide** - Professional item builds
- **Rune Pages** - Optimized rune setups
- **Strategy Guide** - Detailed gameplay tips

### ⭐ **Favorites Management**
- **Add to Favorites** - Heart icon on champion cards
- **Favorites Page** - Access via header button
- **Quick Actions** - Build/Runes/Guide from favorites
- **Remove Favorites** - One-tap management

---

## 🎮 Champion Guide

### 🛠️ **Build System Usage**

1. **Navigate to Champion** → Select any champion
2. **Tap "Build" Button** → View professional builds
3. **Core Items** → Essential items for the champion
4. **Situational Items** → Adapt to enemy team composition
5. **Skill Order** → Level abilities optimally

### 🔮 **Rune Pages**

1. **Access Runes** → Champion detail → "Runes" button
2. **Primary Tree** → Main rune selection
3. **Secondary Tree** → Supporting runes
4. **Stat Shards** → Bonus statistics
5. **Copy Setup** → Use in-game

### 📚 **Strategy Guides**

1. **Champion Guide** → Detailed gameplay information
2. **Laning Phase** → Early game strategies
3. **Team Fighting** → Mid-late game positioning
4. **Combos** → Skill rotation guides
5. **Counters** → Difficult matchups and solutions

---

## ⭐ Favorites System

### 💫 **How to Use Favorites**

1. **Adding Champions:**
   - Tap the heart icon on any champion card
   - Or use "Add to Favorites" in champion details

2. **Managing Favorites:**
   - Access via favorites button in header
   - View all saved champions in one place
   - Quick access to Build/Runes/Guide

3. **Removing Favorites:**
   - Tap heart icon to remove
   - Or use "Clear All" option

### 🎯 **Favorites Features**

- **Real-time Badge** - Shows favorite count
- **Quick Access** - Fast navigation to guides
- **Persistent Storage** - Favorites saved across sessions
- **Visual Indicators** - Golden heart on favorite champions

---

## 🔧 Technical Details

### 🏗️ **Architecture**

```
lib/
├── main.dart                 # App entry point
├── champions.dart            # Champion list & management
├── champion_detail_pages.dart # Build/Runes/Guide pages
├── favorites_manager.dart    # Favorites system
├── favorites_page.dart       # Favorites UI
├── api_service.dart          # Riot API integration
└── riot_champion.dart        # Data models
```

### 📊 **Technologies Used**

- **Flutter Framework** - Cross-platform mobile development
- **Dart Language** - Application logic
- **Riot Games API** - Real-time champion data
- **HTTP Package** - API communication
- **Cached Network Image** - Optimized image loading
- **Material Design** - Modern UI components

### 🎨 **Design System**

- **Dark/Light Theme** - Adaptive theming
- **League of Legends Colors** - Authentic color palette
- **Smooth Animations** - 60fps interactions
- **Responsive Layout** - Works on all screen sizes

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🔧 **Development Setup**

1. **Fork the repository**
2. **Create feature branch:** `git checkout -b feature/amazing-feature`
3. **Commit changes:** `git commit -m 'Add amazing feature'`
4. **Push to branch:** `git push origin feature/amazing-feature`
5. **Open Pull Request**

### 📝 **Contribution Guidelines**

- Follow Dart/Flutter coding standards
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

### 🐛 **Bug Reports**

Found a bug? Please open an issue with:
- Device information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Riot Games** - For the comprehensive API
- **Flutter Team** - For the amazing framework
- **League of Legends Community** - For inspiration and feedback
- **Contributors** - Thank you for your valuable contributions!

---

<div align="center">

**Made with ❤️ for the League of Legends community**

[⬆ Back to Top](#-league-of-legends-ai-coach-application)

</div>
