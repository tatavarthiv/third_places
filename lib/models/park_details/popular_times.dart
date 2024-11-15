import 'package:cloud_firestore/cloud_firestore.dart';

class HourOccupancy {
  final int hour;
  final int occupancyPercent;

  HourOccupancy({
    required this.hour,
    required this.occupancyPercent,
  });

  factory HourOccupancy.fromFirestore(Map<String, dynamic> data) {
    return HourOccupancy(
      hour: data['hour'] as int,
      occupancyPercent: data['occupancyPercent'] as int,
    );
  }
}

class PopularTimes {
  final Map<String, List<HourOccupancy>> dayHours;

  PopularTimes({
    this.dayHours = const {},
  });

  factory PopularTimes.fromFirestore(Map<String, dynamic> data) {
    return PopularTimes(
      dayHours: (data as Map<String, dynamic>?)?.map((day, hours) => MapEntry(
        day,
        (hours as List<dynamic>).map((hourData) => HourOccupancy.fromFirestore(hourData as Map<String, dynamic>)).toList(),
      )) ?? {},
    );
  }
}
