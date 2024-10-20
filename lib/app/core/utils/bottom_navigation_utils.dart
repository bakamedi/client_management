enum BottomNavigationConfig {
  homePage(indexValue: 0),
  calendarPage(indexValue: 1),
  addEventPage(indexValue: 2),
  billPage(indexValue: 3),
  personalInfoPage(indexValue: 4);

  const BottomNavigationConfig({
    required this.indexValue,
  });

  final int indexValue;
}