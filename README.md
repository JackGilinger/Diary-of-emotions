# Diary of Emotions Mobile App

## Project Description
A mobile app designed for users to track, analyze, and manage their emotions through daily journaling. Users can log their emotional states, explore patterns over time, and gain insights to improve their emotional well-being.

## Screens and Flows Specification
### Screens
1. **Splash/Welcome Screen**
   - Logo
   - Brief introductory text

2. **Onboarding Screen**
   - Brief app instruction
   - Quick user setup (optional preferences)

3. **Home Screen**
   - Emotion selection grid
   - Intensity slider from 1-5
   - Text input for additional context
   - Save button

4. **Diary History Screen**
   - Calendar view
   - List of past entries
   - Entry detail view

5. **Statistics and Insights Screen**
   - Graphical visualization (pie chart, bar chart) of emotions
   - Emotional trend insights

6. **Profile & Settings Screen**
   - User preferences
   - Notification settings

### Navigation Flow
- Main navigation through bottom navigation bar
  - Home | History | Insights | Profile
- Splash screen transitions automatically to onboarding (first launch) or home

## Design Requirements
- **Primary Color:** #6200EE (Purple)
- **Accent Color:** #03DAC6 (Teal)
- **Background:** #FFFFFF (White), Dark mode support (#121212 Dark Grey)
- **Typography:** Roboto, normal weight
- **Icons and Branding:** Minimalistic, smooth edges, Material Design standards
- **Spacing and Padding:** 16dp margin and padding standard

## UI Logic
### Splash/Welcome
- Automatically transitions after 2-second timer

### Onboarding
- Optional registration information; information saved via callback

### Home
- Emotion selection, intensity slider, context text input
- "Save" triggers callback to save entry

### Diary History
- Calendar/List toggle
- Entries clickable, triggering detailed view modal
- Callback to load entries

### Statistics
- Display emotion statistics (pie/bar charts)
- Callback to generate statistics

### Profile & Settings
- Multiple toggle options
- Callback for updating preferences/settings

No external APIs or libraries used; implement placeholders for callbacks.

Commit and push the implementation in AppWidget.dart.