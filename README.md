# Emotion Diary App Specification

## Project Description
Emotion Diary is a minimalist mobile application that allows users to track their daily emotions and moods. The app provides a simple interface for users to record how they're feeling, add context notes, and view their emotional patterns over time. The application is designed to be intuitive, private, and visually calming to encourage regular use for emotional awareness and well-being.

## Technical Requirements
- This application will be built entirely within a **single custom widget file**: `EmotionDiaryWidget.dart`
- No external libraries are allowed besides what FlutterFlow provides
- The app must work on both iOS and Android platforms

## Screens & Functionality

### 1. Splash Screen
- App logo and name displayed on startup
- Smooth transition to Home/Dashboard after 2 seconds
- Calming blue gradient background (#E0F7FA to #B2EBF2)

### 2. Dashboard Screen
- Summary of recent emotion entries (last 7 days)
- Quick-add emotion button (prominent floating action button)
- Calendar view for selecting dates to view entries
- Simple emotion trend visualization (basic line or bar chart)
- Navigation to all other screens

### 3. New Entry Screen
- Date and time selector (defaults to current)
- Emotion selector with 5 primary emotions:
  - Happy (Yellow: #FFC107)
  - Sad (Blue: #2196F3)
  - Angry (Red: #F44336)
  - Anxious (Purple: #9C27B0)
  - Calm (Green: #4CAF50)
- Intensity slider (1-5)
- Text area for notes/context (optional)
- Save button
- Cancel button with confirmation dialog

### 4. Entry Details Screen
- Full display of a selected entry
- Date and time
- Selected emotion with color
- Intensity level
- Notes/context
- Option to edit or delete entry
- Back button to return to Dashboard

### 5. Calendar View
- Monthly calendar visualization
- Days with entries marked with the color of the primary emotion
- Tapping on a day shows entries for that day
- Option to switch between month/week view

### 6. Settings Screen
- Toggle for notifications/reminders
- Option to set reminder time
- Dark/Light mode toggle
- Data export option (CSV format)
- Privacy policy link
- About app information

## Design Requirements
- Font: Roboto for headers, Open Sans for body text
- Color scheme:
  - Primary: #03A9F4 (Light Blue)
  - Secondary: #4CAF50 (Green)
  - Background: #FFFFFF (Light mode) / #121212 (Dark mode)
  - Text: #212121 (Light mode) / #EEEEEE (Dark mode)
- Rounded corners on all cards and buttons (8dp radius)
- Subtle shadows for elevation
- Consistent padding (16dp standard)
- Smooth transitions between screens
- Responsive layout for different device sizes

## Logic Flow

### App Initialization
1. App starts → Show Splash Screen
2. After 2 seconds → Navigate to Dashboard
3. If first-time user → Show brief tutorial overlay

### Creating an Entry
1. User taps Quick-add button on Dashboard
2. New Entry Screen appears
3. User selects emotion, sets intensity, adds optional notes
4. On Save → Store entry in local database
5. Return to Dashboard with updated summary

### Viewing Entries
1. User can access entries via Dashboard summary or Calendar
2. Tapping on an entry opens Entry Details Screen
3. From Details Screen, user can edit or delete the entry

### Reminders (if enabled)
1. Daily notification at user-set time
2. Tapping notification opens New Entry Screen

## Data Model
- Emotion Entry:
  - Unique ID
  - Date and Time
  - Emotion Type (enum)
  - Intensity (integer 1-5)
  - Notes (string)

## Privacy and Security
- All data stored locally on device
- No user account required
- Optional passcode/biometric protection for app access

## Minimum Viable Features for App Store
1. Creating and saving emotion entries
2. Viewing past entries
3. Basic emotion visualization
4. Calendar navigation
5. Light/dark mode support
6. Local data storage
7. Privacy policy compliance