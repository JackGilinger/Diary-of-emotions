// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NewEntryWidget extends StatefulWidget {
  const NewEntryWidget({
    Key? key,
    this.width,
    this.height, 
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<void> Function(Map<String, dynamic> entry) onSave;
  final Future<void> Function() onCancel;

  @override
  _NewEntryWidgetState createState() => _NewEntryWidgetState();
}

class _NewEntryWidgetState extends State<NewEntryWidget> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedEmotion;
  Color? _selectedEmotionColor;
  final TextEditingController _notesController = TextEditingController();
  
  final List<Map<String, dynamic>> _emotions = [
    {'name': 'Happy', 'color': const Color(0xFFFFD700), 'icon': Icons.sentiment_very_satisfied},
    {'name': 'Sad', 'color': const Color(0xFF6495ED), 'icon': Icons.sentiment_dissatisfied},
    {'name': 'Angry', 'color': const Color(0xFFFF6347), 'icon': Icons.sentiment_very_dissatisfied},
    {'name': 'Anxious', 'color': const Color(0xFF9370DB), 'icon': Icons.psychology},
    {'name': 'Calm', 'color': const Color(0xFF98FB98), 'icon': Icons.spa},
    {'name': 'Tired', 'color': const Color(0xFFD3D3D3), 'icon': Icons.bedtime},
  ];

  bool get _isValid => _selectedEmotion != null;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _selectEmotion(String emotion, Color color) {
    setState(() {
      _selectedEmotion = emotion;
      _selectedEmotionColor = color;
    });
  }

  Future<void> _saveEntry() async {
    if (!_isValid) return;
    
    final entry = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'date': _selectedDate,
      'emotion': _selectedEmotion,
      'emotionColor': _selectedEmotionColor,
      'notes': _notesController.text.trim(),
    };
    
    await widget.onSave(entry);
  }

  Future<void> _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: FlutterFlowTheme.of(context).primary,
              onPrimary: Colors.white,
              surface: FlutterFlowTheme.of(context).primaryBackground,
              onSurface: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedDate.hour,
          _selectedDate.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'New Entry',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _showDiscardDialog();
            },
          ),
          actions: [
            TextButton(
              onPressed: _isValid ? _saveEntry : null,
              child: Text(
                'Save',
                style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                  color: _isValid 
                    ? Colors.white 
                    : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ],
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date selector
                  Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: _showDatePicker,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            SizedBox(width: 16),
                            Text(
                              _formatDate(_selectedDate),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Emotion selection
                  Text(
                    'How are you feeling?',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  SizedBox(height: 16),
                  
                  // Emotion grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _emotions.length,
                    itemBuilder: (context, index) {
                      final emotion = _emotions[index];
                      final isSelected = _selectedEmotion == emotion['name'];
                      
                      return GestureDetector(
                        onTap: () => _selectEmotion(
                          emotion['name'] as String,
                          emotion['color'] as Color,
                        ),
                        child: Card(
                          elevation: isSelected ? 4 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: isSelected
                                ? BorderSide(
                                    color: emotion['color'] as Color,
                                    width: 2,
                                  )
                                : BorderSide.none,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: (emotion['color'] as Color).withOpacity(
                                  isSelected ? 1.0 : 0.6,
                                ),
                                radius: 24,
                                child: Icon(
                                  emotion['icon'] as IconData,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                emotion['name'] as String,
                                style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Notes field
                  Text(
                    'Notes (optional)',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _notesController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write down your thoughts...',
                      hintStyle: FlutterFlowTheme.of(context).bodySmall.copyWith(
                        color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.6),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

  void _showDiscardDialog() {
    final bool hasChanges = _selectedEmotion != null || _notesController.text.isNotEmpty;
    
    if (!hasChanges) {
      widget.onCancel();
      return;
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Discard Changes?'),
        content: Text('You have unsaved changes. Are you sure you want to discard them?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onCancel();
            },
            child: Text(
              'Discard',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}