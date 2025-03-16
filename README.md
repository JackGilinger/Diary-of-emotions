# Emotion Diary App Specification

## Project Description
The Emotion Diary is a simple mobile application that allows users to track and record their emotions and feelings throughout the day. Users can create new diary entries with emotion tags, add notes, view history, and get basic insights about their emotional patterns. The app focuses on minimal functionality while providing value to users.

## Single Widget File Implementation
All app functionality will be implemented in a single custom widget file: `EmotionDiaryWidget.dart`

No external libraries will be used beyond what FlutterFlow provides.

## App Screens and Sections

### 1. Welcome/Login Screen
- **Design:** Clean, calming color palette (light blue #E3F2FD background with navy #1A237E accents)
- **Elements:**
  - App logo/title "Emotion Diary"
  - Brief app description
  - Login button (email/password)
  - Register button
  - Continue as guest option

### 2. Home/Dashboard Screen
- **Design:** White background with emotion-related imagery, card-based UI
- **Elements:**
  - Header with app name and user avatar
  - "How are you feeling today?" prompt
  - Quick emotion selection (5-7 primary emotions as circular buttons)
  - Calendar/date selector showing current week
  - "Add New Entry" prominent button
  - Recent entries list (last 3-5 entries)
  - Bottom navigation with Home, History, and Profile icons

### 3. New Entry Screen
- **Design:** Clean form with appropriate spacing, light background
- **Elements:**
  - Date/time selector (defaults to current)
  - Emotion selection grid (happy, sad, angry, anxious, calm, excited, etc.)
  - Intensity slider (1-5)
  - Notes text field with prompt "What made you feel this way?"
  - Activity tags (work, family, social, health, etc.)
  - Location option (manual entry)
  - Save and Cancel buttons

### 4. History/Journal Screen
- **Design:** Scrollable timeline with card entries
- **Elements:**
  - Month/year selector at top
  - Calendar view toggle option
  - List of entries with:
    - Date and time
    - Emotion icon
    - Brief preview of notes
    - Swipe actions for edit/delete

### 5. Entry Detail Screen
- **Design:** Full-screen view of a single entry
- **Elements:**
  - Date and time header
  - Large emotion icon/representation
  - Intensity indicator
  - Full notes content
  - Tagged activities
  - Location (if entered)
  - Edit and Delete buttons
  - Back button

### 6. Basic Statistics Screen
- **Design:** Simple charts and visualizations
- **Elements:**
  - Emotion distribution pie chart for selected time period
  - Weekly emotion trend line/bar graph
  - Most frequent emotions list
  - Common activities associated with positive/negative emotions

### 7. User Profile Screen
- **Design:** Simple profile layout
- **Elements:**
  - User photo (optional)
  - Name and basic info
  - App settings:
    - Notifications toggle
    - Dark/light mode toggle
    - Reminder settings
  - Export data option
  - Logout button

## Logic and Functionality

### Authentication Logic
- Simple email/password authentication
- Option to use app without account (local storage only)
- Password reset via email

### Entry Creation Logic
- New entries saved to local database
- Cloud sync for logged-in users
- Validation to ensure emotion is selected before saving
- Option to add photos limited to one per entry

### History and Navigation Logic
- Chronological sorting of entries (newest first by default)
- Filter options by emotion type and date range
- Swipe between days in detail view
- Search functionality by keywords in notes

### Data Management
- Local storage for offline access
- Cloud backup for registered users
- Data export as CSV/PDF
- Auto-sync when connection available

### Notifications
- Daily reminder at user-selected time
- Option to disable all notifications
- Gentle prompts if no entries for 3+ days

## Minimal Viable Features
For AppStore readiness, the application must have at minimum:
1. User account creation and login
2. Ability to create, edit, and delete emotion entries
3. Emotion selection with intensity rating
4. Notes for each entry
5. History view of past entries
6. Basic data persistence
7. Simple, intuitive UI with consistent styling

## Design Guidelines
- Font: Roboto for headers, Open Sans for body text
- Color scheme: 
  - Primary: #1976D2 (blue)
  - Secondary: #FFA000 (amber)
  - Background: #FFFFFF (white)
  - Text: #212121 (dark gray)
  - Accents based on emotions (happy = yellow, sad = blue, etc.)
- Icons: Material Design icon set
- Consistent padding (16px standard)
- Responsive layout working on all mobile form factors