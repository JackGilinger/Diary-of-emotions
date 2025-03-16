// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';

class EntryDetailWidget extends StatefulWidget {
  const EntryDetailWidget({
    Key? key,
    this.width,
    this.height,
    required this.entry,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.onBackPressed,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Map<String, dynamic> entry;
  final Future<void> Function() onEditPressed;
  final Future<void> Function() onDeletePressed;
  final Future<void> Function() onBackPressed;

  @override
  _EntryDetailWidgetState createState() => _EntryDetailWidgetState();
}

class _EntryDetailWidgetState extends State<EntryDetailWidget> {
  bool _showDeleteConfirmation = false;

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

  Color _getEmotionColor(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return const Color(0xFFFFD700);
      case 'sad':
        return const Color(0xFF6495ED);
      case 'angry':
        return const Color(0xFFFF6347);
      case 'anxious':
        return const Color(0xFF9370DB);
      case 'calm':
        return const Color(0xFF98FB98);
      case 'tired':
        return const Color(0xFFD3D3D3);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime entryDate = widget.entry['date'] as DateTime;
    final String emotion = widget.entry['emotion'] as String;
    final String notes = widget.entry['notes'] as String;
    final Color emotionColor = _getEmotionColor(emotion);

    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Entry Details',
            style: FlutterFlowTheme.of(context).titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: widget.onBackPressed,
          ),
          elevation: 0,
          backgroundColor: FlutterFlowTheme.of(context).primary,
        ),
        body: _showDeleteConfirmation
            ? _buildDeleteConfirmation()
            : _buildEntryDetails(context, entryDate, emotion, notes, emotionColor),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }

  Widget _buildEntryDetails(
    BuildContext context,
    DateTime entryDate,
    String emotion,
    String notes,
    Color emotionColor,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Date display with formatted date
          Text(
            DateFormat.yMMMMd().format(entryDate),
            style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          
          SizedBox(height: 8),
          
          Text(
            DateFormat.jm().format(entryDate),
            style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          
          SizedBox(height: 24),
          
          // Large emotion icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: emotionColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getEmotionIcon(emotion),
              size: 70,
              color: Colors.white,
            ),
          ),
          
          SizedBox(height: 16),
          
          // Emotion text
          Text(
            emotion,
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          
          SizedBox(height: 24),
          
          // Notes section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notes',
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
                SizedBox(height: 8),
                Text(
                  notes.isEmpty ? 'No notes added.' : notes,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          
          SizedBox(height: 32),
          
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Edit'),
                onPressed: widget.onEditPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: () {
                  setState(() {
                    _showDeleteConfirmation = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).error,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteConfirmation() {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: FlutterFlowTheme.of(context).error,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Delete Entry?',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              SizedBox(height: 8),
              Text(
                'This action cannot be undone.',
                style: FlutterFlowTheme.of(context).bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showDeleteConfirmation = false;
                      });
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onDeletePressed();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterFlowTheme.of(context).error,
                    ),
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}