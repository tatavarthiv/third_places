import 'package:flutter/material.dart';
import 'package:parks/models/park.dart';
import 'package:parks/models/park_details/sports_facilities.dart';

class SportsFacilitiesWidget extends StatelessWidget {
  final SportsFacilities sportsFacilities;

  const SportsFacilitiesWidget({
    super.key,
    required this.sportsFacilities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sports Facilities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 8.0, 
              mainAxisSpacing: 8.0, 
              childAspectRatio: 3, 
            ),
            children: _buildSportsFacilitiesList(),
          ),
        ),
      ],
    );
  }

  // Helper method to build sports facilities list
  List<Widget> _buildSportsFacilitiesList() {
    final sportsFacilitiesMap = <String, bool>{
        'Baseball': sportsFacilities.hasBaseball,
        'Tennis': sportsFacilities.hasTennis,
        'Basketball': sportsFacilities.hasBasketball,
        'Volleyball': sportsFacilities.hasVolleyball,
        'Golf': sportsFacilities.hasGolf,
        'Fitness Center': sportsFacilities.hasFitnessCenter,
        'Skateboarding': sportsFacilities.hasSkateboarding,
    };

    return sportsFacilitiesMap.entries
        .where((entry) => entry.value) // Filter only available facilities
        .map((entry) => _buildSportsFacilityBox(entry.key))
        .toList();
  }

  // Helper method to build a single facility box
  Widget _buildSportsFacilityBox(String facilityName) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          facilityName,
          textAlign: TextAlign.center, // Ensure text is centered
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
