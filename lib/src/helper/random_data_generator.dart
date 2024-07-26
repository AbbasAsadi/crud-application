import 'dart:math';

import 'package:crud/src/helper/date_extensions.dart';

class RandomDataGenerator {
  static final List<String> _authorNameList = [
    'John Smith',
    'Jane Doe',
    'Alex Johnson',
    'Emily Brown',
    'Chris Williams',
    'Katie Davis',
    'Sarah Hernandez',
    'David Jones',
  ];
  static final List<DateTime> _dateList = [
    DateTime(1997, 6, 2),
    DateTime(2023, 4, 12),
    DateTime(2024, 1, 9),
    DateTime(2023, 11, 8),
    DateTime(2022, 2, 20),
    DateTime(2022, 7, 29),
    DateTime(2023, 3, 13),
    DateTime(2024, 7, 25),
  ];

  static String getRandomAuthorName() {
    final random = Random();
    String fullName = _authorNameList[random.nextInt(_authorNameList.length)];
    return fullName;
  }

  static String getRandomReleaseDate() {
    final random = Random();
    DateTime releaseDate = _dateList[random.nextInt(_dateList.length)];
    return releaseDate.formatDate;
  }
}
