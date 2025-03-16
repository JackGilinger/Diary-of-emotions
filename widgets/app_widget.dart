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

  const AppWidget({required this.width, required this.height, Key? key})
      : super(key: key);

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
      default:
        return _buildSplashScreen();
    }
  }

  Widget _buildSplashScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {_currentScreen = 1;});
    });

    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book, size: 100.0, color: Color(0xFF6200EE)),
          const SizedBox(height: 20),
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
}