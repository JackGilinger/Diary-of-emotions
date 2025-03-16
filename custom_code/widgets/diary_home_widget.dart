// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryHomeWidget extends StatefulWidget {
  const DiaryHomeWidget({
    Key? key,
    this.width,
    this.height,
    required this.onNewEntryPressed,
    required this.onEntrySelected,
    required this.onSettingsPressed,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<void> Function() onNewEntryPressed;
  final Future<void> Function(Map<String, dynamic> entry) onEntrySelected;
  final Future<void> Function() onSettingsPressed;

  @override
  _DiaryHomeWidgetState createState() => _DiaryHomeWidgetState();
}

class _DiaryHomeWidgetState extends State<DiaryHomeWidget> {
  // Mock data for initial development - replace with actual database
  List<Map<String, dynamic>> _entries = [];
  DateTime _selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    // TODO: Replace with actual database fetch
    // Mock data for now
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _entries = [
        {
          'id': '1',
          'date': DateTime.now(),
          'emotion': 'Happy',
          'emotionColor': const Color(0xFFFFD700),
          'notes': 'Had a great day at the park!'
        },
        {
          'id': '2',
          'date': DateTime.now().subtract(const Duration(days: 1)),
          'emotion': 'Sad',
          'emotionColor': const Color(0xFF6495ED),
          'notes': 'Missing my friends today.'
        },
        {
          'id': '3',
          'date': DateTime.now().subtract(const Duration(days: 2)),
          'emotion': 'Angry',
          'emotionColor': const Color(0xFFFF6347),
          'notes': 'Stuck in traffic for hours.'
        },
      ];
      _isLoading = false;
    });
  }

  List<Map<String, dynamic>> _getEntriesForSelectedDate() {
    return _entries.where((entry) {
      final entryDate = entry['date'] as DateTime;
      return DateUtils.isSameDay(entryDate, _selectedDate);
    }).toList();
  }

  Future<void> _refreshEntries() async {
    setState(() {
      _isLoading = true;
    });
    await _loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Emotion Diary',
            style: FlutterFlowTheme.of(context).titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: widget.onSettingsPressed,
            ),
          ],
          elevation: 0,
          backgroundColor: FlutterFlowTheme.of(context).primary,
        ),
        body: RefreshIndicator(
          onRefresh: _refreshEntries,
          child: Column(
            children: [
              // Calendar for date selection
              Card(
                margin: EdgeInsets.all(8.0),
                elevation: 2,
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _selectedDate,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  eventLoader: (day) {
                    // Highlight dates with entries
                    return _entries
                        .where((entry) => DateUtils.isSameDay(entry['date'] as DateTime, day))
                        .toList();
                  },
                ),
              ),
              
              // Divider between calendar and entries
              Divider(height: 1),
              
              // Entry list or empty state
              Expanded(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _buildEntryList(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: widget.onNewEntryPressed,
          child: Icon(Icons.add),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      ),
    );
  }

  Widget _buildEntryList() {
    final entriesForSelectedDate = _getEntriesForSelectedDate();
    
    if (entriesForSelectedDate.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: entriesForSelectedDate.length,
      itemBuilder: (context, index) {
        final entry = entriesForSelectedDate[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: entry['emotionColor'] as Color,
              child: Icon(
                _getEmotionIcon(entry['emotion'] as String),
                color: Colors.white,
              ),
            ),
            title: Text(
              entry['emotion'] as String,
              style: FlutterFlowTheme.of(context).titleMedium,
            ),
            subtitle: Text(
              entry['notes'] as String,
              style: FlutterFlowTheme.of(context).bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              DateFormat.jm().format(entry['date'] as DateTime),
              style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            onTap: () => widget.onEntrySelected(entry),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_satisfied_alt,
            size: 70,
            color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.5),
          ),
          SizedBox(height: 16),
          Text(
            'No entries for this date',
            style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap + to add how you\'re feeling',
            style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                  color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }

  IconData _getEmotionIcon(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return Icons.sentiment_very_satisfied;
      case 'sad':
        return Icons.sentiment_dissatisfied;
      case 'angry':
        return Icons.sentiment_very_dissatisfied;
      case 'anxious':
        return Icons.psychology;
      case 'calm':
        return Icons.spa;
      case 'tired':
        return Icons.bedtime;
      default:
        return Icons.emoji_emotions;
    }
  }
}