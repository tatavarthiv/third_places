import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';  // Add this for date formatting

class DayOpenAndClose {
  final String day;
  final List<Map<String, DateTime>> openAndClose;

  DayOpenAndClose({
    required this.day,
    required this.openAndClose,
  });

  factory DayOpenAndClose.fromFirestore(Map<String, dynamic> data) {
    var hoursList = data['hours'] as List<dynamic>;

    // Format for the 'HH:mm' time strings
    final dateFormat = DateFormat("HH:mm");

    List<Map<String, DateTime>> openAndCloseList = hoursList.map((hourData) {
      return {
        'open': dateFormat.parse(hourData['open'] as String),
        'close': dateFormat.parse(hourData['close'] as String),
      };
    }).toList();

    return DayOpenAndClose(
      day: data['day'] as String,
      openAndClose: openAndCloseList,
    );
  }
}

class OpeningHours {
  final List<DayOpenAndClose> openingHours;

  OpeningHours({
    this.openingHours = const [],
  });

  factory OpeningHours.fromFirestore(Map<String, dynamic> data) {
    return OpeningHours(
      openingHours: (data['opening_hours'] as List<dynamic>).map((dayData) {
        return DayOpenAndClose.fromFirestore(dayData as Map<String, dynamic>);
      }).toList(),
    );
  }
}
