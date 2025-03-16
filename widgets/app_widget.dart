// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback? onEmotionAdded;

  const AppWidget({
    Key? key,
    required this.width,
    required this.height,
    this.onEmotionAdded,
  }) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int currentScreen = 0; 
  String selectedEmotion = '';
  String diaryText = '';

  void transitionToNext() {
    setState(() => currentScreen++);
  }

  Widget buildScreen() {
    switch (currentScreen) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How are you feeling?', style: FlutterFlowTheme.of(context).bodyText1),
            Wrap(
              spacing: 10,
              children: ['Happy', 'Sad', 'Angry', 'Excited'].map((emotion) {
                return ElevatedButton(
                  onPressed: () {
                    selectedEmotion = emotion;
                    transitionToNext();
                  },
                  child: Text(emotion),
                );
              }).toList(),
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Why do you feel $selectedEmotion?', style: FlutterFlowTheme.of(context).bodyText1),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                minLines: 1,
                maxLines: 5,
                onChanged: (value) => diaryText = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your thoughts...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                transitionToNext();
                if (widget.onEmotionAdded != null) widget.onEmotionAdded!();
              },
              child: Text('Save and Continue'),
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 60, color: Colors.green),
            SizedBox(height: 20),
            Text('Emotion Recorded!', style: FlutterFlowTheme.of(context).bodyText1),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentScreen = 0;
                  selectedEmotion = '';
                  diaryText = '';
                });
              },
              child: Text('Add Another'),
            ),
          ],
        );
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: buildScreen(),
    );
  }
}