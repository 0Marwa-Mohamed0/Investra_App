# Investra - Connect, Invest, Grow 🚀

Investra is a comprehensive platform designed to bridge the gap between **Entrepreneurs** and **Investors**. It provides a secure and intuitive environment for pitching ideas, tracking investments, and collaborating on the next big thing.

---

## 📱 Features

### 1. 🛡️ Authentication & Security
- **Supabase Integration**: Secure backend and database management.
- **Email/Password Auth**: Reliable login and registration flow.
- **Social Login**: Seamless "Continue with Google" integration.
- **Role-Based Access**: Automatic navigation based on user role (Investor or Entrepreneur).
- **Password Recovery**: Integrated "Forgot Password" functionality via email reset.

### 2. ✨ User Experience (UX)
- **Smart Splash Screen**: A dual-layered splash transition:
    - **Native Layer**: Displays the `small_logo` instantly on startup.
    - **Flutter Layer**: A smooth animation of the `big_logo` with a subtle fade-in and scale effect.
- **Onboarding**: A professional walkthrough for new users to understand the platform's value.
- **Responsive UI**: "Mofarfad" (Spacious) and professional design optimized for various screen sizes.

### 3. 🤖 Advanced Capabilities
- **AI Chatbot**: Intelligent assistant for investment guidance and platform support.
- **Idea Submission**: Specialized flow for entrepreneurs to submit their startup ideas.
- **Post/Idea Cards**: Interactive UI elements to view and manage investment opportunities.

---

## 🛠️ Technical Stack

- **Framework**: [Flutter](https://flutter.dev/) (Material 3)
- **Backend**: [Supabase](https://supabase.com/) (Auth, Database, Storage)
- **Local Storage**: `shared_preferences` for device state (e.g., onboarding status).
- **Icons & Splash**:
    - `flutter_launcher_icons`: For automated app icon generation.
    - `flutter_native_splash`: For the initial boot-up screen.
- **UI Helpers**: `gap` for consistent spacing, `flutter_svg` for vector graphics.

---

## 📂 Project Structure

```text
lib/
├── core/               # App constants, styles, and reusable widgets
├── features/           # Feature-based modular structure
│   ├── auth/           # Login, Register, Forgot Password, Roles
│   ├── splash/         # Animated splash screen
│   ├── onboarding/     # New user walkthrough
│   ├── home/           # Main dashboards and feeds
│   ├── ai_chatbot/     # AI integration
│   ├── submit_idea/    # Idea submission flow
│   └── ...             # Notifications, Profile, Idea Details, etc.
└── main.dart           # App entry point and theme configuration
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed.
- Supabase project configured.

### Commands to Setup Assets
If you modify icons or the splash screen, run these commands:

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Generate App Icons**:
   ```bash
   flutter pub run flutter_launcher_icons
   ```

3. **Generate Native Splash Screen**:
   ```bash
   flutter pub run flutter_native_splash:create
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

---

## 🎨 Design Assets
- **Primary Color**: `#1E4D7B` (Deep Blue)
- **Big Logo**: `assets/images/big_logo.png` (Full branding)
- **Small Logo**: `assets/images/small_logo.png` (Iconic brand mark)

---

Developed with ❤️ for the future of investment.
