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

class HomeDashboardWidget extends StatefulWidget {
  const HomeDashboardWidget({
    Key? key,
    required this.width,
    required this.height,
    this.onNewEntryPressed,
    this.onCalendarDaySelected,
    this.onEmotionSelected,
    this.onSettingsPressed,
    this.onHistoryPressed,
    this.onStatsPressed,
    this.username = '',
    this.emotionEntries = const {},
  }) : super(key: key);

  final double width;
  final double height;
  final Future<void> Function()? onNewEntryPressed;
  final Future<void> Function(DateTime)? onCalendarDaySelected;
  final Future<void> Function(String, int)? onEmotionSelected;
  final Future<void> Function()? onSettingsPressed;
  final Future<void> Function()? onHistoryPressed;
  final Future<void> Function()? onStatsPressed;
  final String username;
  final Map<DateTime, String> emotionEntries;

  @override
  _HomeDashboardWidgetState createState() => _HomeDashboardWidgetState();
}

class _HomeDashboardWidgetState extends State<HomeDashboardWidget> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.week;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  // Helper method to get color based on emotion
  Color _getEmotionColor(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return const Color(0xFFFFEB3B); // Yellow
      case 'sad':
        return const Color(0xFF5D9CEC); // Blue
      case 'angry':
        return const Color(0xFFF44336); // Red
      case 'anxious':
        return const Color(0xFF9C27B0); // Purple
      case 'neutral':
        return const Color(0xFFBDBDBD); // Gray
      case 'excited':
        return const Color(0xFFFF9800); // Orange
      case 'peaceful':
        return const Color(0xFF4CAF50); // Green
      default:
        return const Color(0xFFBDBDBD); // Default to gray
    }
  }

  Future<void> _selectEmotion(String emotion, int intensity) async {
    if (widget.onEmotionSelected == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onEmotionSelected!(emotion, intensity);
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = FlutterFlowTheme.of(context).primary; // #5D9CEC (calm blue)
    final accentColor = Color(0xFFFFA726); // #FFA726 (warm orange)
    final backgroundColor = Color(0xFFF5F7FA); // #F5F7FA (light gray)
    final textColor = Color(0xFF333333); // #333333 (dark gray)
    
    // Get today's formatted date
    final todayDate = DateFormat.yMMMMd().format(DateTime.now());
    
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header with greeting and date
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello${widget.username.isNotEmpty ? ', ${widget.username}' : ''}!',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      Text(
                        todayDate,
                        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: widget.onSettingsPressed,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            
            // Calendar view
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  
                  if (widget.onCalendarDaySelected != null) {
                    widget.onCalendarDaySelected!(selectedDay);
                  }
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  markersMaxCount: 1,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    // Convert date to a key format that matches emotionEntries
                    final dateKey = DateTime(date.year, date.month, date.day);
                    if (widget.emotionEntries.containsKey(dateKey)) {
                      final emotion = widget.emotionEntries[dateKey] ?? 'neutral';
                      return Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getEmotionColor(emotion),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Quick emotion selection section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How are you feeling today?',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildEmotionButton('Happy', Icons.sentiment_very_satisfied, Colors.yellow),
                      _buildEmotionButton('Sad', Icons.sentiment_very_dissatisfied, Colors.blue),
                      _buildEmotionButton('Angry', Icons.mood_bad, Colors.red),
                      _buildEmotionButton('Anxious', Icons.sentiment_neutral, Colors.purple),
                      _buildEmotionButton('Neutral', Icons.sentiment_neutral, Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            
            Spacer(),
            
            // Bottom Action Buttons
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: widget.onNewEntryPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 8),
                        Text(
                          'Add New Entry',
                          style: FlutterFlowTheme.of(context).titleSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.onHistoryPressed,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                            side: BorderSide(color: primaryColor),
                            minimumSize: Size(0, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.history),
                              SizedBox(height: 4),
                              Text('History'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.onStatsPressed,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                            side: BorderSide(color: primaryColor),
                            minimumSize: Size(0, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.bar_chart),
                              SizedBox(height: 4),
                              Text('Stats'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEmotionButton(String emotion, IconData iconData, Color color) {
    return InkWell(
      onTap: () => _selectEmotion(emotion, 5), // Default intensity set to 5
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: color,
                size: 32,
              ),
            ),
            SizedBox(height: 4),
            Text(
              emotion,
              style: FlutterFlowTheme.of(context).bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}