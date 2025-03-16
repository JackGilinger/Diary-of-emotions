# Emotion Diary App Specification

## Project Overview
The Emotion Diary app allows users to track their emotions and moods over time with a clean, intuitive interface. Users can create diary entries with emotion tags, notes, and view their emotional patterns through simple visualizations.

## Core Functionality
1. User authentication (email/password)
2. Daily emotion logging with customizable tags
3. Calendar view of past entries
4. Basic statistics/trends visualization
5. Reminder notifications
6. Data export

## Screens and Widgets

### 1. Authentication Screen
- Login form with email and password fields
- Registration option
- Password recovery link
- App logo and welcome text
- Social login buttons (optional)

### 2. Home/Dashboard Screen
- Current date display
- Quick emotion logging buttons (happy, sad, angry, anxious, neutral)
- Calendar view showing emotion colors for past days
- "Add New Entry" button
- Bottom navigation bar

### 3. New Entry Screen
- Date and time selector (defaults to current)
- Emotion selection with emojis (5-7 primary emotions)
- Intensity slider (1-10)
- Text area for notes/thoughts
- Activity tags (work, family, social, health, etc.)
- Photo attachment option (single image)
- Save button

### 4. Calendar/History Screen
- Monthly calendar view with emotion color coding
- List view of entries below calendar
- Search and filter options
- Tap to view entry details

### 5. Entry Detail Screen
- Full entry display with emotion, intensity, notes
- Date and time information
- Edit and delete options
- Share functionality (optional)

### 6. Statistics Screen
- Weekly emotion distribution chart
- Monthly trends line graph
- Most frequent emotions display
- Correlation between activities and emotions (simple)

### 7. Settings Screen
- Notification preferences
- Dark/light mode toggle
- Data export option
- Account management
- Privacy policy and terms
- App version and about information

## Visual Design

### Color Scheme
- Primary: #5D9CEC (calm blue)
- Secondary: #FFFFFF (white)
- Accent: #FFA726 (warm orange)
- Background: #F5F7FA (light gray)
- Text: #333333 (dark gray)

### Emotions Color Coding
- Happy: #FFEB3B (yellow)
- Sad: #5D9CEC (blue)
- Angry: #F44336 (red)
- Anxious: #9C27B0 (purple)
- Neutral: #BDBDBD (gray)
- Excited: #FF9800 (orange)
- Peaceful: #4CAF50 (green)

### Typography
- Primary Font: San Francisco (iOS) / Roboto (Android)
- Headings: Bold, 24sp/18sp/16sp
- Body Text: Regular, 14sp
- Buttons: Medium, 14sp

## Data Structure

### User Profile
- User ID
- Email
- Display name
- Notification settings
- Theme preference

### Diary Entry
- Entry ID
- User ID (foreign key)
- Timestamp
- Primary emotion
- Emotion intensity (1-10)
- Notes text
- Activity tags (array)
- Image URL (optional)

## Logic Requirements

### Authentication Logic
- Validate email format and password strength
- Store authentication tokens securely
- Implement password reset flow
- Handle session management

### Entry Creation Logic
- Default to current date/time
- Require at least one emotion selection
- Optional note text and tags
- Local storage backup before cloud sync
- Confirm save with visual feedback

### Calendar/History Logic
- Load entries by month
- Cache recently viewed months
- Color days based on primary emotion
- Handle empty states gracefully
- Sort entries chronologically

### Statistics Logic
- Calculate weekly emotion distribution
- Track emotion trends by day of week
- Identify correlations between activities and emotions
- Cache calculations to improve performance

### Notification Logic
- Daily reminder at user-defined time
- Respect system notification permissions
- Deep link to new entry screen

## Minimum Viable Product Features
1. User account creation and authentication
2. Daily emotion logging with notes
3. Calendar view of past entries
4. Basic emotion trend visualization
5. Data persistence (local and cloud)
6. Simple settings management

## Future Enhancements (Post-MVP)
1. Multiple emotions per entry
2. Advanced analytics
3. Journaling prompts/guided reflection
4. Mood patterns and trigger identification
5. Export to PDF/CSV
6. Social sharing features
7. Custom emotion tags