import 'package:parks/models/park_details/popular_times.dart';
import 'package:parks/models/park_details/opening_hours.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HourlyOccupancyWidget extends StatelessWidget {
  final List<DayOpenAndClose> openingHours;
  final PopularTimes popularTimes;

  const HourlyOccupancyWidget({
    super.key,
    required this.openingHours,
    required this.popularTimes,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final currentHour = now.hour;

    final today = DateFormat('EEEE').format(now);
    final todayShort = DateFormat('E').format(now).substring(0, 2);

    // Get today's opening hours
    final todayOpeningHours = openingHours.firstWhere(
      (entry) => entry.day == today,
      orElse: () => DayOpenAndClose(day: today, openAndClose: []),
    );

    if (todayOpeningHours.openAndClose.isEmpty) {
      return const SizedBox.shrink();
    }

    // Get today's popular times
    final todayPopularTimes = popularTimes.dayHours[todayShort] ?? [];

    // Determine the range of hours
    final openingTime = todayOpeningHours.openAndClose.first['open']!;
    final closingTime = todayOpeningHours.openAndClose.last['close']!;
    final openingHour = openingTime.hour;
    final closingHour = closingTime.hour;

    // Generate data for each hour
    final hourlyData = List.generate(
      closingHour - openingHour + 1,
      (index) {
        final hour = openingHour + index;
        final occupancy = todayPopularTimes.firstWhere(
          (data) => data.hour == hour,
          orElse: () => HourOccupancy(hour: hour, occupancyPercent: -1),
        );

        return {
          'hour': hour,
          'occupancyPercent': occupancy.occupancyPercent,
        };
      },
    );

    // Widget UI
    return SizedBox(
      height: 130, 
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: hourlyData.map((data) {
                final hour = data['hour'] as int;
                final occupancy = data['occupancyPercent'] ?? -1;
                final hasData = occupancy != -1;

                final isCurrentHour = hour == currentHour;

                return Flexible(
                  child: Container(
                    width: 6,
                    height: hasData ? (occupancy * 1).toDouble() : 10, 
                    decoration: BoxDecoration(
                      color: isCurrentHour
                          ? theme.colorScheme.primary 
                          : Colors.lightBlue[100], 
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: hourlyData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              final hour = data['hour'] ?? 0;

              // Show label every 4 hours
              if (index % 4 == 0) {
                return Text(
                  DateFormat.j().format(DateTime(0, 1, 1, hour)),
                  style: theme.textTheme.bodySmall,
                );
              } else {
                return const SizedBox(width: 8); 
              }
            }).toList(),
          ),
        ],
      ),
    );
  }
}