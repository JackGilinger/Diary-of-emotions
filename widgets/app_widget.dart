// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class AppWidget extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback? onSaveEntry;
  final VoidCallback? onLoadEntries;
  final VoidCallback? onGenerateStatistics;
  final VoidCallback? onUpdatePreferences;

  const AppWidget({
    required this.width,
    required this.height,
    this.onSaveEntry,
    this.onLoadEntries,
    this.onGenerateStatistics,
    this.onUpdatePreferences,
    Key? key,
  }) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _currentScreen = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _currentScreen = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 0:
        return buildSplash();
      case 1:
        return buildOnboarding();
      case 2:
        return buildHome();
      case 3:
        return buildDiaryHistory();
      case 4:
        return buildStatistics();
      case 5:
        return buildProfileSettings();
      default:
        return buildSplash();
    }
  }

  Widget buildSplash() => Center(
        child: Text('Welcome to Diary of Emotions',
            style: Theme.of(context).textTheme.headline4),
      );

  Widget buildOnboarding() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Track and analyze your emotions daily!',
              style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
              onPressed: () => setState(() => _currentScreen = 2),
              child: Text('Start Journey')),
        ],
      );

  Widget buildHome() => Column(
        children: [
          Text('How do you feel?', style: Theme.of(context).textTheme.headline5),
          Slider(value: 3, min: 1, max: 5, onChanged: (v) {}),
          TextField(decoration: InputDecoration(labelText: 'Context')),
          ElevatedButton(
              onPressed: widget.onSaveEntry,
              child: Text('Save')),
          ElevatedButton(
              onPressed: () => setState(() => _currentScreen = 3),
              child: Text('View History')),
        ],
      );

  Widget buildDiaryHistory() => Column(
        children: [
          ElevatedButton(
              onPressed: widget.onLoadEntries,
              child: Text('Load Previous Entries')),
          ElevatedButton(
              onPressed: () => setState(() => _currentScreen = 4),
              child: Text('Statistics')),
        ],
      );

  Widget buildStatistics() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your Emotional Pattern', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
              onPressed: widget.onGenerateStatistics,
              child: Text('Refresh')),
          ElevatedButton(
              onPressed: () => setState(() => _currentScreen = 5),
              child: Text('Settings')),
        ],
      );

  Widget buildProfileSettings() => Column(
        children: [
          SwitchListTile(title: Text('Notification'), value: true, onChanged: (_) => widget.onUpdatePreferences?.call()),
          ElevatedButton(
              onPressed: () => setState(() => _currentScreen = 2),
              child: Text('Back Home')),
        ],
      );
}