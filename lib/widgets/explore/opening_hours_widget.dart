// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:parks/models/park_details/opening_hours.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpeningHoursWidget extends StatelessWidget {
  final List<DayOpenAndClose> openingHours; 

  const OpeningHoursWidget({
    super.key,
    required this.openingHours,
  });

  // Function to get the current day of the week (e.g., "Monday", "Tuesday")
  String getCurrentDay() {
    final currentDate = DateTime.now();
    final dayOfWeek = currentDate.weekday; 
    switch (dayOfWeek) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return ''; 
    }
  }

  String formatTime(DateTime time) {
    final DateFormat formatter = DateFormat('h:mm a'); 
    return formatter.format(time);
  }

  @override
  Widget build(BuildContext context) {
    // Get the current day of the week dynamically
    final currentDay = getCurrentDay();

    // Find the DayOpenAndClose object for the current day
    final dayData = openingHours.firstWhere(
      (day) => day.day == currentDay,
      orElse: () => DayOpenAndClose(day: currentDay, openAndClose: []), 
    );

    if (dayData.openAndClose.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          'Opening Hours unavailable',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    } else {

      String timeRanges = dayData.openAndClose.map((hours) {
        final openingTime = hours['open'];
        final closingTime = hours['close'];

        if (openingTime != null && closingTime != null) {
          return '${formatTime(openingTime)} - ${formatTime(closingTime)}';
        } else {
          return 'Unavailable';
        }
      }).join(', '); 

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Open ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const TextSpan(
                text: ' ·  ', 
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, 
                )
              ),
              TextSpan(
                text: timeRanges,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
