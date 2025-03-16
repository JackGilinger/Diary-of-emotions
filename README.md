# Emotion Diary Mobile App

## Project Description
The Emotion Diary is a mobile application designed to help users track, analyze, and reflect on their emotions over time. Users can record their daily emotional states along with contextual information, view patterns in their emotional well-being, and gain insights into factors that influence their moods.

## Detailed Specification

### Screens/Flows

#### 1. Welcome/Onboarding Screen
- Displays app name "Emotion Diary" with a calming logo
- Brief introduction to the app's purpose
- "Get Started" button to proceed to the main screen

#### 2. Main Dashboard Screen
- Current date and time display
- User's recent emotion entries (last 5)
- Quick-add emotion button (floating action button)
- Analytics summary showing emotional trends
- Navigation to other sections (Calendar, Analytics, Settings)

#### 3. New Entry Screen
- Date and time selector (defaults to current)
- Emotion selection (using a grid of emotion icons: Happy, Sad, Angry, Anxious, Calm, Excited, Tired, Content)
- Intensity slider (1-10)
- Factors that contributed to the emotion (multi-select: Work, Family, Health, Social, Weather, Sleep, Exercise, Nutrition)
- Notes text field for detailed journaling
- Submit and Cancel buttons

#### 4. Calendar View Screen
- Monthly calendar with color-coded days based on dominant emotion
- Tapping a date shows emotion summaries for that day
- Option to add a new entry for a selected date

#### 5. Analytics Screen
- Emotion distribution pie chart
- Weekly/monthly emotional trends line graph
- Common factors associated with positive/negative emotions
- Average emotional intensity over time

#### 6. Entry Details Screen
- Detailed view of a specific emotion entry
- Edit and Delete options
- Previous/Next entry navigation

#### 7. Settings Screen
- Notification preferences
- Theme options (Light/Dark)
- Export data option
- About and Help sections

### Design Requirements

#### Color Scheme
- Primary: #5C7AEA (Calming blue)
- Secondary: #FFA500 (Warm orange for contrast)
- Background: #F5F7FA (Light gray for main background)
- Success: #4CAF50 (Green for positive emotions)
- Warning: #FF9800 (Orange for neutral emotions)
- Danger: #F44336 (Red for negative emotions)
- Text primary: #333333
- Text secondary: #666666

#### Typography
- Main font: Roboto or system default
- Heading sizes: 24sp (h1), 20sp (h2), 18sp (h3)
- Body text: 16sp
- Small text: 14sp

#### UI Elements
- Rounded corners (8dp radius) for cards and buttons
- Subtle shadows for elevation
- Consistent padding (16dp standard)
- Emotion icons should be simple, recognizable, and consistent in style

### UI Logic and Transitions

#### Navigation Logic
- The app uses a bottom navigation bar for main sections (Dashboard, Calendar, Analytics, Settings)
- The new entry screen is accessed via FAB from any main section
- The app maintains state when navigating between sections

#### Screen Transitions
- Dashboard to New Entry: Slide up animation
- Between main sections: Fade transition
- To Entry Details: Shared element transition from the entry card

#### Business Logic Callbacks
- `onEmotionSelected(String emotionType)`: Handle emotion selection in the New Entry screen
- `onIntensityChanged(int intensityValue)`: Update intensity value in the New Entry screen
- `onFactorsSelected(List<String> factors)`: Handle selection of contributing factors
- `onEntrySubmit(EmotionEntry entry)`: Save the emotion entry to storage
- `onDateSelected(DateTime date)`: Retrieve entries for the selected date
- `onDeleteEntry(String entryId)`: Remove an entry from storage
- `onUpdateEntry(EmotionEntry updatedEntry)`: Update an existing entry
- `getEmotionTrends(DateTime startDate, DateTime endDate)`: Calculate emotion trends for analytics
- `getEmotionDistribution(DateTime startDate, DateTime endDate)`: Calculate distribution of emotions for the pie chart
- `getFactorAnalysis(String emotionType)`: Analyze common factors for a specific emotion

#### User Flow
1. User opens app → Welcome screen → Dashboard
2. User taps "+" → New Entry screen → fills data → submits → returns to Dashboard with updated data
3. User taps Calendar → selects date → views entries → can select entry for details
4. User taps Analytics → views emotional trends and insights
5. Long-pressing an entry card anywhere opens the Entry Details screen