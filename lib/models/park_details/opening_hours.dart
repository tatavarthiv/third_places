import 'package:intl/intl.dart';

class DayOpenAndClose {
  final String day;
  final List<Map<String, DateTime>> openAndClose;

  DayOpenAndClose({
    required this.day,
    required this.openAndClose,
  });

  factory DayOpenAndClose.fromFirestore(Map<String, dynamic> data) {
    final dateFormat = DateFormat("HH:mm");

    // Ensure 'hours' is a valid list
    var hoursList = data['hours'] as List<dynamic>? ?? [];

    List<Map<String, DateTime>> openAndCloseList = hoursList.map((hourData) {
      try {
        return {
          'open': dateFormat.parse(hourData['open'] as String),
          'close': dateFormat.parse(hourData['close'] as String),
        };
      } catch (e) {
        throw FormatException('Invalid time format in hours: $hourData');
      }
    }).toList();

    return DayOpenAndClose(
      day: data['day'] as String? ?? 'Unknown', 
      openAndClose: openAndCloseList,
    );
  }
}
