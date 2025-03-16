// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// TODO: Implement Welcome Screen
// TODO: Implement Home/Dashboard Screen
// TODO: Implement New Entry Screen
// TODO: Implement Entry Details Screen
// TODO: Implement Analytics Screen
// TODO: Implement Settings Screen

class AppWidget extends StatefulWidget {
  final double width;
  final double height;

  const AppWidget({required this.width, required this.height});

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  String currentScreen = 'welcome';

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case 'welcome':
        return WelcomeScreen();
      case 'home':
        return HomeScreen();
      case 'newEntry':
        return NewEntryScreen();
      case 'entryDetails':
        return EntryDetailsScreen();
      case 'analytics':
        return AnalyticsScreen();
      case 'settings':
        return SettingsScreen();
      default:
        return WelcomeScreen();
    }
  }

  Widget WelcomeScreen() {
    // TODO: Build Welcome Screen UI
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Emotion Diary'),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                setState(() => currentScreen = 'home');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget HomeScreen() {
    // TODO: Build Home Screen UI
    return Container();
  }

  Widget NewEntryScreen() {
    // TODO: Build New Entry UI
    return Container();
  }

  Widget EntryDetailsScreen() {
    // TODO: Build Entry Details UI
    return Container();
  }

  Widget AnalyticsScreen() {
    // TODO: Build Analytics UI
    return Container();
  }

  Widget SettingsScreen() {
    // TODO: Build Settings UI
    return Container();
  }
}