// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class EntryDetailWidget extends StatefulWidget {
  const EntryDetailWidget({
    Key? key,
    this.width,
    this.height,
    required this.entryData,
    required this.onEdit,
    required this.onDelete,
    required this.onBack,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Map<String, dynamic> entryData;
  final Future<void> Function(Map<String, dynamic> entry) onEdit;
  final Future<void> Function(String entryId) onDelete;
  final Future<void> Function() onBack;

  @override
  _EntryDetailWidgetState createState() => _EntryDetailWidgetState();
}

class _EntryDetailWidgetState extends State<EntryDetailWidget> {
  late Map<String, dynamic> _entry;

  @override
  void initState() {
    super.initState();
    _entry = Map<String, dynamic>.from(widget.entryData);
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Entry'),
        content: Text('Are you sure you want to delete this entry? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onDelete(_entry['id'] as String);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emotion = _entry['emotion'] as String;
    final emotionColor = _entry['emotionColor'] as Color;
    final notes = _entry['notes'] as String;
    final date = _entry['date'] as DateTime;

    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: widget.onBack,
          ),
          title: Text(
            'Entry Detail',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => widget.onEdit(_entry),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _showDeleteConfirmation,
            ),
          ],
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and time
              Card(
                elevation: 0,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatDate(date),
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          SizedBox(height: 4),
                          Text(
                            _formatTime(date),
                            style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 24),
              
              // Emotion display
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: emotionColor.withOpacity(0.2),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: emotionColor,
                        ),
                        child: Icon(
                          _getEmotionIcon(emotion),
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      emotion,
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 36),
              
              // Notes section
              if (notes.isNotEmpty) ...[
                Text(
                  'Notes',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                SizedBox(height: 8),
                Card(
                  elevation: 0,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      notes,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ] else ...[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'No notes added',
                      style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (isSameDay(date, now)) {
      return 'Today';
    } else if (isSameDay(date, now.subtract(Duration(days: 1)))) {
      return 'Yesterday';
    } else {
      return '${_getDayOfWeek(date.weekday)}, ${_getMonthName(date.month)} ${date.day}, ${date.year}';
    }
  }

  String _formatTime(DateTime date) {
    final hour = date.hour == 0 ? 12 : (date.hour > 12 ? date.hour - 12 : date.hour);
    final period = date.hour < 12 ? 'AM' : 'PM';
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _getDayOfWeek(int day) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[day - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
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