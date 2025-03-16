# Emotion Diary App Specification

## Project Description
The Emotion Diary App is a minimalist application allowing users to track their emotions on a daily basis. Users can create entries with an emotion selection, optional notes, and view their emotion history. The app focuses on simplicity and clean user experience, with just enough functionality to be valuable for users tracking their emotional wellbeing.

## Screens & Widgets

### 1. Home Screen (DiaryHomeWidget)
- Top app bar with app name and settings icon
- Calendar view for date selection  
- List view of recent emotion entries (scrollable)
- New entry floating action button
- Empty state when no entries exist

### 2. Entry Creation Screen (NewEntryWidget)
- Date selector (defaulting to current date)
- Emotion selector (grid or list of emotion icons)
- Text field for notes/context
- Save button
- Cancel button

### 3. Entry Detail Screen (EntryDetailWidget)
- Selected emotion display (large icon)
- Date and time information
- Notes/context display
- Edit button
- Delete button
- Back button

### 4. History/Analytics Screen (HistoryWidget)
- Filter options (week, month, year)
- Simple emotion distribution chart
- List of entries filterable by date range
- Export option (basic CSV format)

### 5. Settings Screen (SettingsWidget)
- App theme toggle (light/dark)
- Notification settings (daily reminder)
- Data management (export/clear all)
- About section with app information

## Logic Specifications

### DiaryHomeWidget
- Load and display emotion entries from local database
- Enable date selection via calendar to view entries for specific dates
- Sort entries by date (most recent first)
- Navigate to NewEntryWidget when FAB is pressed
- Navigate to EntryDetailWidget when an entry is tapped
- Implement pull-to-refresh for entry list
- Display appropriate empty state when no entries exist

### NewEntryWidget
- Allow selection of emotion from predefined options
- Validate entry (emotion selection required, notes optional)
- Save entry to local database with timestamp
- Return to home screen after successful save
- Implement cancel confirmation if changes would be lost

### EntryDetailWidget
- Load and display specific entry details from local database
- Enable editing of existing entry
- Implement delete functionality with confirmation dialog
- Navigate back to previous screen

### HistoryWidget
- Query database for entries within selected date range
- Calculate simple statistics on emotion distribution
- Display chart visualization of emotion frequency
- Enable export of filtered data in simple format

### SettingsWidget
- Manage app theme preference in local storage
- Configure daily reminder notifications
- Implement data export to local file
- Provide option to clear all data with confirmation

## Visual Design Requirements

### Color Scheme
- Primary: #4A6FA5 (calm blue)
- Secondary: #FFB347 (warm orange)
- Background (Light): #F5F5F5
- Background (Dark): #1E1E1E
- Text Primary (Light): #333333
- Text Primary (Dark): #FFFFFF
- Emotion Colors:
  - Happy: #FFD700
  - Sad: #6495ED
  - Angry: #FF6347
  - Anxious: #9370DB
  - Calm: #98FB98
  - Tired: #D3D3D3

### Typography
- App Title: Roboto Bold, 24sp
- Screen Titles: Roboto Medium, 20sp
- Body Text: Roboto Regular, 16sp
- Button Text: Roboto Medium, 16sp
- Entry Date: Roboto Light Italic, 14sp

### Icons & Images
- Emotion icons: Simple, recognizable line icons with color accents
- Navigation icons: Standard Material Design icons
- App icon: Minimalist diary with emotion elements

### Layout
- Consistent padding: 16dp for screen edges
- Card elevation: 2dp for entry cards
- Bottom navigation height: 56dp
- Floating action button margin: 16dp

## Widgets to Implement

1. **DiaryHomeWidget (Stateful)**
   - Manages the home screen state and entry list display

2. **NewEntryWidget (Stateful)**
   - Handles the creation of new diary entries

3. **EntryDetailWidget (Stateful)**
   - Displays and manages individual entry details

4. **HistoryWidget (Stateful)**
   - Manages the emotion history visualization and filtering

5. **SettingsWidget (Stateful)**
   - Handles app configuration options

6. **EmotionSelectorWidget (Stateful)**
   - Reusable grid/list of selectable emotion icons

7. **EntryCardWidget (Stateless)**
   - Displays a single entry in the list view

8. **EmotionChartWidget (Stateless)**
   - Renders the emotion distribution chart

9. **DatePickerWidget (Stateful)**
   - Custom date selection component

10. **ConfirmDialogWidget (Stateless)**
    - Reusable confirmation dialog for destructive actions