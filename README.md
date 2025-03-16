# Emotion Diary App Specification

## Project Description
The Emotion Diary is a mobile application that enables users to track and reflect on their emotions over time. Users can create daily entries with their emotional state, add notes about their feelings, and visualize their emotional patterns through simple analytics. The app aims to promote emotional intelligence and self-awareness by encouraging regular emotional check-ins.

## Screen/Flow Requirements

### Single Widget Architecture
All screens will be implemented within a single `AppWidget.dart` file, using a state-based approach to manage different "screens" without actual navigation.

### Required Screens

1. **Welcome Screen**
   - App logo and name
   - Brief description of app purpose
   - "Get Started" button

2. **Home/Dashboard Screen**
   - Calendar view showing days with entries (highlighted)
   - Current date prominently displayed
   - Emotion summary for current week (small chart)
   - "Add Entry" floating action button
   - List of recent entries (scrollable)

3. **New Entry Screen**
   - Date selector (defaults to current date)
   - Time selector
   - Emotion selector (grid of emotion icons: Happy, Sad, Angry, Anxious, Neutral, Excited, Tired, Calm)
   - Intensity slider (1-10)
   - Text field for notes/journal
   - Tags/context selector (Home, Work, Family, Friends, etc.)
   - Save and Cancel buttons

4. **Entry Details Screen**
   - Full entry display (date, time, emotion, intensity, notes)
   - Edit button
   - Delete button
   - Back button to return to dashboard

5. **Analytics Screen**
   - Emotion distribution chart (pie or bar chart)
   - Emotion intensity over time (line chart)
   - Common tags/contexts associated with emotions
   - Date range selector (week, month, year)
   - Export data option

6. **Settings Screen**
   - Reminder settings (on/off, time)
   - Theme toggle (light/dark)
   - Privacy options (passcode protection)
   - Data management (export/backup/delete)

## Design Requirements

### Color Scheme
- Primary: #6200EE (deep purple)
- Secondary: #03DAC6 (teal)
- Background: #FFFFFF (white) / #121212 (dark mode)
- Happy: #FFD700 (gold)
- Sad: #4169E1 (royal blue)
- Angry: #FF4500 (red-orange)
- Anxious: #9932CC (dark orchid)
- Neutral: #A9A9A9 (dark gray)
- Excited: #FF1493 (deep pink)
- Tired: #8B4513 (saddle brown)
- Calm: #20B2AA (light sea green)

### Typography
- Headings: Roboto Bold
- Body text: Roboto Regular
- Journal entries: Roboto Light Italic
- Font sizes:
  - Large titles: 24sp
  - Section headers: 18sp
  - Body text: 16sp
  - Supporting text: 14sp

### UI Elements
- Rounded corners (8dp) for cards and buttons
- Elevation for cards (2dp)
- Material Design icons
- Gentle animations for transitions between "screens"
- Haptic feedback for emotion selection

## UI Logic

### State Management
- `currentScreen` variable to track which "screen" to display
- `selectedDate` to track currently selected date
- `entries` list to store all diary entries
- `currentEntry` to track the entry being viewed or edited

### Screen Transitions
- Welcome → Home: When "Get Started" is tapped
- Home → New Entry: When "Add Entry" button is tapped
- Home → Entry Details: When an entry from the list is tapped
- Home → Analytics: When analytics tab/button is tapped
- Home → Settings: When settings icon is tapped
- New Entry → Home: When "Save" or "Cancel" is tapped
- Entry Details → Home: When "Back" is tapped
- Entry Details → New Entry: When "Edit" is tapped (with entry data populated)
- Analytics → Home: When back button is tapped
- Settings → Home: When back button is tapped

### Callbacks for Business Logic
- `createEntry(date, time, emotion, intensity, notes, tags)`: Create a new diary entry
- `getEntries(startDate, endDate)`: Retrieve entries for a date range
- `updateEntry(entryId, newData)`: Update an existing entry
- `deleteEntry(entryId)`: Remove an entry
- `getEmotionStats(dateRange)`: Calculate emotion statistics for analytics
- `exportData(format, dateRange)`: Export diary data
- `saveSettings(settingsData)`: Save user preferences
- `setReminder(time, days)`: Configure reminder notifications

Each "screen" within the AppWidget will be conditionally rendered based on the current state, creating a seamless single-widget application experience that mimics multi-screen navigation.