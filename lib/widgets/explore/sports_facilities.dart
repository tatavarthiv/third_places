import 'package:flutter/material.dart';
import 'package:parks/models/park_details/sports_facilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SportsFacilitiesWidget extends StatefulWidget {
  final SportsFacilities sportsFacilities;

  const SportsFacilitiesWidget({
    super.key,
    required this.sportsFacilities,
  });

  @override
  _SportsFacilitiesWidgetState createState() => _SportsFacilitiesWidgetState();
}

class _SportsFacilitiesWidgetState extends State<SportsFacilitiesWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    final primaryColor = theme.colorScheme.primary;
    final cardColor = theme.colorScheme.surface;
    const textColor = Colors.black;
    final borderColor = theme.colorScheme.secondaryContainer;

    // Get the available sports facilities
    final availableFacilities = _buildSportsFacilitiesList(
      cardColor: cardColor,
      textColor: textColor,
      borderColor: borderColor,
      primaryColor: primaryColor,
    );

    if (availableFacilities.isEmpty) {
      return const SizedBox.shrink(); 
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sports Facilities',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 16),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3,
          ),
          children: _isExpanded
              ? availableFacilities 
              : availableFacilities.take(4).toList(),
        ),
        if (availableFacilities.length > 4)
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isExpanded ? 'See Less' : 'See More',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                  color: primaryColor,
                  size: 18.0, 
                ),
              ],
            ),
          ),
      ],
    );
  }

  // Helper method to build sports facilities list
  List<Widget> _buildSportsFacilitiesList({
    required Color cardColor,
    required Color textColor,
    required Color borderColor,
    required Color primaryColor,
  }) {
    final sportsFacilitiesMap = <String, bool>{
      'Baseball': widget.sportsFacilities.hasBaseball,
      'Tennis': widget.sportsFacilities.hasTennis,
      'Basketball': widget.sportsFacilities.hasBasketball,
      'Volleyball': widget.sportsFacilities.hasVolleyball,
      'Golf': widget.sportsFacilities.hasGolf,
      'Fitness Center': widget.sportsFacilities.hasFitnessCenter,
      'Skateboarding': widget.sportsFacilities.hasSkateboarding,
    };

    return sportsFacilitiesMap.entries
        .where((entry) => entry.value) 
        .map(
          (entry) => _buildSportsFacilityBox(
            facilityName: entry.key,
            cardColor: cardColor,
            textColor: textColor,
            borderColor: borderColor,
            primaryColor: primaryColor,
          ),
        )
        .toList();
  }

  Widget _buildSportsFacilityBox({
    required String facilityName,
    required Color cardColor,
    required Color textColor,
    required Color borderColor,
    required Color primaryColor,
  }) {
    IconData? facilityIcon = _getSportIcon(facilityName);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
        color: cardColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: FaIcon(
              facilityIcon,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 6), 
          Expanded(
            child: Text(
              facilityName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData? _getSportIcon(String sport) {
    switch (sport) {
      case 'Baseball':
        return FontAwesomeIcons.baseball;
      case 'Tennis':
        return FontAwesomeIcons.baseball;
      case 'Basketball':
        return FontAwesomeIcons.basketball;
      case 'Volleyball':
        return FontAwesomeIcons.volleyball;
      case 'Golf':
        return FontAwesomeIcons.golfBallTee;
      case 'Fitness Center':
        return FontAwesomeIcons.dumbbell;
      case 'Skateboarding':
        return FontAwesomeIcons.ban;
      default:
        return null; 
    }
  }
}
