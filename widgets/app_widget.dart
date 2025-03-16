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

  // Emotion colors based on README specs
  Map<String, Color> emotionColors = {
    'Happy': Color(0xFFFFD700), // Joy
    'Sad': Color(0xFF1E90FF),   // Sadness
    'Angry': Color(0xFFFF0000), // Anger
    'Excited': Color(0xFF00FFFF), // Using Anticipation color
  };

  void transitionToNext() {
    setState(() => currentScreen++);
  }

  Widget buildScreen() {
    switch (currentScreen) {
      case 0:
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How are you feeling?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6200EE), // Primary color from README
                ),
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: ['Happy', 'Sad', 'Angry', 'Excited'].map((emotion) {
                  return ElevatedButton(
                    onPressed: () {
                      selectedEmotion = emotion;
                      transitionToNext();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: emotionColors[emotion],
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      emotion,
                      style: TextStyle(
                        color: emotionColors[emotion] == Color(0xFFFFD700) ? Colors.black : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Why do you feel $selectedEmotion?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6200EE), // Primary color from README
                ),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFF03DAC6), width: 2), // Secondary color
                ),
                child: TextField(
                  minLines: 4,
                  maxLines: 6,
                  onChanged: (value) => diaryText = value,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: 'Enter your thoughts...',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  transitionToNext();
                  if (widget.onEmotionAdded != null) widget.onEmotionAdded!();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6200EE), // Primary color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Save and Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF03DAC6).withOpacity(0.1), // Secondary color with opacity
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Color(0xFF03DAC6), // Secondary color from README
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Emotion Recorded!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6200EE), // Primary color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your "$selectedEmotion" emotion has been saved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentScreen = 0;
                    selectedEmotion = '';
                    diaryText = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6200EE), // Primary color
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Add Another',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
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