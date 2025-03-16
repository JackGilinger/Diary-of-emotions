# EmotionDiary Mobile App

## Project Description
EmotionDiary is a personal mobile application that allows users to track their emotional state over time. Users can record their emotions, add notes about what triggered them, and view their emotional patterns through simple visualizations. The app focuses on mental wellness by encouraging emotional self-awareness.

## Screen Specifications

### 1. Welcome Screen
- Simple splash screen with app logo and name
- Automatic transition to Home/Dashboard after 2 seconds
- First-time users will be directed to a quick onboarding screen instead

### 2. Onboarding Screen (first-time users only)
- Brief explanation of the app's purpose
- How to record emotions
- Privacy assurance
- "Get Started" button that leads to the Dashboard

### 3. Dashboard/Home Screen
- Calendar view showing the last 7 days with color-coded emotion indicators
- Quick-add emotion buttons (Happy, Sad, Angry, Anxious, Neutral)
- "Add Detailed Entry" button
- Navigation to History and Profile screens
- Current date and greeting message ("Good morning/afternoon/evening, [User]")

### 4. Add Entry Screen
- Date and time selector (defaults to current)
- Emotion selector with 8 primary emotions (Joy, Sadness, Fear, Disgust, Anger, Surprise, Trust, Anticipation)
- Intensity slider (1-5)
- Text field for notes/triggers
- Activity tags (Work, Family, Friends, Health, etc.)
- Location option (optional)
- Save and Cancel buttons

### 5. Entry Detail Screen
- Displays full details of a selected entry
- Options to edit or delete the entry
- Back button to return to previous screen

### 6. History Screen
- Monthly calendar view with emotion color coding
- List view of entries below the calendar
- Filter options by emotion, date range, and intensity
- Search functionality for notes

### 7. Stats/Insights Screen
- Weekly and monthly emotion distribution charts
- Common triggers based on notes analysis
- Mood trends over time
- Most frequent emotions

### 8. Profile/Settings Screen
- User name (editable)
- Notification preferences
- Theme options (Light/Dark/System)
- Export data option
- About section
- Privacy policy link

## Design Requirements

### Color Scheme
- Primary color: #6200EE (purple)
- Secondary color: #03DAC6 (teal)
- Background: #FFFFFF (light mode), #121212 (dark mode)
- Text: #000000 (light mode), #FFFFFF (dark mode)

### Emotion Colors
- Joy: #FFD700 (gold)
- Sadness: #1E90FF (blue)
- Fear: #800080 (purple)
- Disgust: #32CD32 (green)
- Anger: #FF0000 (red)
- Surprise: #FF69B4 (pink)
- Trust: #FFA500 (orange)
- Anticipation: #00FFFF (cyan)
- Neutral: #A9A9A9 (gray)

### Typography
- Headings: Roboto Bold
- Body text: Roboto Regular
- Button text: Roboto Medium
- Font sizes:
  - Large headings: 24sp
  - Headings: 20sp
  - Subheadings: 16sp
  - Body text: 14sp
  - Small text: 12sp

### UI Elements
- Rounded corners (8dp radius) for all cards and buttons
- Elevation shadows for cards and floating action buttons
- Bottom navigation bar for main navigation
- Floating action button for quick entry addition

## UI Logic

### Navigation Flow
- The app will use a stateful widget to manage screen transitions within AppWidget.dart
- A simple state management approach will track current screen and handle transitions
- Bottom navigation will allow switching between Dashboard, History, Stats, and Profile

### State Management
- _currentScreen variable to track which screen is displayed
- _userEntries list to store emotion diary entries
- _currentUser object for user preferences

### Callbacks and Handlers
- `_handleEmotionSelection(String emotion, int intensity)` - Process emotion selection
- `_saveEntry(EmotionEntry entry)` - Save a new diary entry
- `_updateEntry(String entryId, EmotionEntry updatedEntry)` - Edit existing entry
- `_deleteEntry(String entryId)` - Remove an entry
- `_filterEntries(Map<String, dynamic> filters)` - Apply filters to entry list
- `_generateStats()` - Calculate statistics for insights screen
- `_updateUserPreferences(Map<String, dynamic> preferences)` - Save user settings

### Data Structures
- EmotionEntry class with properties:
  - id (unique identifier)
  - dateTime (when the emotion was recorded)
  - emotion (primary emotion)
  - intensity (1-5 scale)
  - notes (text description)
  - tags (list of activity tags)
  - location (optional)

### Transitions
- Slide transitions between screens
- Fade transition for splash screen
- Scale transition for emotion selection

### Persistence
- Local storage for entries using shared preferences
- No external authentication required