# Emotion Diary App

## Project Description
Emotion Diary is a minimalist mobile application designed to help users track and record their emotions throughout the day. With an intuitive interface and straightforward functionality, users can quickly log their emotional state, add context notes, and review their emotional patterns over time.

## Screens and Flow Specification

### 1. Splash Screen
- Simple splash screen with app logo and name "Emotion Diary"
- Auto-transitions to Home Screen after 2 seconds

### 2. Home Screen
- Header with app name "Emotion Diary"
- Current date display
- Summary of today's entries (if any)
- Large "Add Entry" button at the bottom
- Calendar view displaying days with entries
- Navigation to History Screen via tab or button

### 3. Add Entry Screen
- Date and time selector (defaulted to current)
- Emotion selector with 5 basic emotions:
  * Happy 😊
  * Sad 😢
  * Angry 😠
  * Anxious 😰
  * Calm 😌
- Intensity slider (1-5)
- Text field for notes/context (optional)
- "Save" button
- "Cancel" button returning to Home Screen

### 4. History Screen
- List view of all entries, sorted by date (newest first)
- Each entry shows:
  * Date/time
  * Emotion icon
  * Intensity
  * Preview of notes
- Tapping an entry opens the Entry Detail Screen

### 5. Entry Detail Screen
- Full view of a single entry
- All details (date, time, emotion, intensity, notes)
- "Edit" button
- "Delete" button with confirmation dialog
- "Back" button to return to History Screen

### 6. Settings Screen (Minimal)
- Toggle for dark/light mode
- Option to export data
- About section with app version

## Design Requirements

### Color Scheme
- Primary: #5C7AEA (calm blue)
- Secondary: #FFA500 (warm orange)
- Background: #FFFFFF (light mode) / #121212 (dark mode)
- Text: #333333 (light mode) / #E0E0E0 (dark mode)
- Happy: #FFD700 (gold)
- Sad: #4169E1 (royal blue)
- Angry: #FF4500 (red-orange)
- Anxious: #9370DB (medium purple)
- Calm: #90EE90 (light green)

### Typography
- App Title: SF Pro Display Bold, 24pt
- Headers: SF Pro Text Semibold, 18pt
- Body Text: SF Pro Text Regular, 16pt
- Button Text: SF Pro Text Medium, 16pt

### UI Elements
- Rounded corners (12px radius) on all cards and buttons
- Subtle shadows for elevation
- Emotion icons should be consistent and expressive
- Intensity represented by both number and visual indicator

## UI Logic

### AppWidget.dart Structure
The application will use a single StatefulWidget with a PageController to manage "screens" as views within the widget:

```
class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  // Controller to manage page transitions
  final PageController _pageController = PageController();
  
  // Current page index
  int _currentPage = 0;
  
  // Data storage for emotions
  List<EmotionEntry> _entries = [];
  
  // Theme mode
  bool _darkMode = false;
  
  // Methods for page navigation
  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = page;
    });
  }
  
  // Business logic callbacks
  void _addEmotionEntry(EmotionEntry entry) {
    setState(() {
      _entries.add(entry);
    });
    _navigateToPage(0); // Return to home
  }
  
  void _deleteEmotionEntry(EmotionEntry entry) {
    setState(() {
      _entries.remove(entry);
    });
    _navigateToPage(2); // Return to history
  }
  
  void _updateEmotionEntry(EmotionEntry oldEntry, EmotionEntry newEntry) {
    setState(() {
      final index = _entries.indexOf(oldEntry);
      if (index != -1) {
        _entries[index] = newEntry;
      }
    });
    _navigateToPage(3); // Return to detail view
  }
  
  void _toggleDarkMode() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }
  
  void _exportData() {
    // Stub for export functionality
    // In a real implementation, this would format the data and prepare it for export
  }
  
  @override
  Widget build(BuildContext context) {
    // Theme data based on mode
    final theme = _darkMode ? ThemeData.dark() : ThemeData.light();
    
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Disable swiping
          children: [
            // 0: Home Screen
            HomeScreen(
              entries: _entries,
              onAddEntry: () => _navigateToPage(1),
              onViewHistory: () => _navigateToPage(2),
              onOpenSettings: () => _navigateToPage(5),
            ),
            
            // 1: Add Entry Screen
            AddEntryScreen(
              onSave: _addEmotionEntry,
              onCancel: () => _navigateToPage(0),
            ),
            
            // 2: History Screen
            HistoryScreen(
              entries: _entries,
              onEntryTap: (entry) {
                _selectedEntry = entry;
                _navigateToPage(3);
              },
              onBack: () => _navigateToPage(0),
            ),
            
            // 3: Entry Detail Screen
            EntryDetailScreen(
              entry: _selectedEntry,
              onEdit: () => _navigateToPage(4),
              onDelete: _deleteEmotionEntry,
              onBack: () => _navigateToPage(2),
            ),
            
            // 4: Edit Entry Screen (reusing Add Entry with prefilled data)
            AddEntryScreen(
              initialEntry: _selectedEntry,
              onSave: (newEntry) => _updateEmotionEntry(_selectedEntry, newEntry),
              onCancel: () => _navigateToPage(3),
            ),
            
            // 5: Settings Screen
            SettingsScreen(
              darkMode: _darkMode,
              onToggleDarkMode: _toggleDarkMode,
              onExportData: _exportData,
              onBack: () => _navigateToPage(0),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Data Model
```
class EmotionEntry {
  final DateTime timestamp;
  final String emotion; // "happy", "sad", "angry", "anxious", "calm"
  final int intensity; // 1-5
  final String notes;
  
  EmotionEntry({
    required this.timestamp,
    required this.emotion,
    required this.intensity,
    this.notes = "",
  });
}
```

### Transitions
- All screen transitions will use the PageController with animated transitions
- No external navigation or routing needed
- All state is managed within the AppWidget

### Critical Callbacks
- `_addEmotionEntry`: Saves a new emotion entry
- `_deleteEmotionEntry`: Removes an existing entry
- `_updateEmotionEntry`: Modifies an existing entry
- `_toggleDarkMode`: Switches between light and dark themes
- `_exportData`: Prepares data for export (stub function)

This design ensures all functionality is contained within a single widget while maintaining a clean separation of concerns between different "screens" of the application.