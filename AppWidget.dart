import 'package:flutter/material.dart';

// Data model for emotion entries
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
  
  // Selected entry for detail view
  EmotionEntry? _selectedEntry;
  
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
      theme: theme.copyWith(
        primaryColor: Color(0xFF5C7AEA),
        colorScheme: theme.colorScheme.copyWith(
          secondary: Color(0xFFFFA500),
          background: _darkMode ? Color(0xFF121212) : Colors.white,
        ),
        textTheme: theme.textTheme.copyWith(
          displayLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _darkMode ? Color(0xFFE0E0E0) : Color(0xFF333333),
          ),
          headlineMedium: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _darkMode ? Color(0xFFE0E0E0) : Color(0xFF333333),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 16,
            color: _darkMode ? Color(0xFFE0E0E0) : Color(0xFF333333),
          ),
        ),
      ),
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
              entry: _selectedEntry!,
              onEdit: () => _navigateToPage(4),
              onDelete: _deleteEmotionEntry,
              onBack: () => _navigateToPage(2),
            ),
            
            // 4: Edit Entry Screen (reusing Add Entry with prefilled data)
            AddEntryScreen(
              initialEntry: _selectedEntry,
              onSave: (newEntry) => _updateEmotionEntry(_selectedEntry!, newEntry),
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