// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class AppWidget extends StatefulWidget {
  final double width;
  final double height;

  const AppWidget({required this.width, required this.height, Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 0:
        return _buildSplashScreen();
      case 1:
        return _buildOnboarding();
      case 2:
        return _buildDashboard();
      default:
        return _buildSplashScreen();
    }
  }

  Widget _buildSplashScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _currentScreen = 1);
    });
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book, size: 100, color: Color(0xFF6200EE)),
          SizedBox(height: 20),
          Text(
            'Welcome to Diary of Emotions',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboarding() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Track and analyze your emotions every day!',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() => _currentScreen = 2);
            },
            child: Text('Get Started'),
            style: ElevatedButton.styleFrom(primary: Color(0xFF6200EE)),
          )
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select your current emotion',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EmotionButton('😊', 'Happy'),
              EmotionButton('😔', 'Sad'),
              EmotionButton('😡', 'Angry'),
              EmotionButton('😨', 'Anxious'),
            ],
          ),
        ],
      ),
    );
  }
}

class EmotionButton extends StatelessWidget {
  final String emotionIcon;
  final String emotionLabel;

  EmotionButton(this.emotionIcon, this.emotionLabel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emotionIcon, style: TextStyle(fontSize: 40)),
        SizedBox(height: 8),
        Text(emotionLabel, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}