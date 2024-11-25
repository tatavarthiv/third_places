import 'package:flutter/material.dart';
import 'package:parks/models/park_details/community_facilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommunityFacilitiesWidget extends StatefulWidget {
  final CommunityFacilities communityFacilities;

  const CommunityFacilitiesWidget({
    super.key,
    required this.communityFacilities,
  });

  @override
  _CommunityFacilitiesWidgetState createState() =>
      _CommunityFacilitiesWidgetState();
}

class _CommunityFacilitiesWidgetState extends State<CommunityFacilitiesWidget> {
  bool _isExpanded = false; 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final cardColor = theme.colorScheme.surface;
    const textColor = Colors.black;
    final borderColor = theme.colorScheme.secondaryContainer;

    // Map the facilities into a list
    final communityFacilitiesMap = <String, bool>{
      'Restroom': widget.communityFacilities.hasRestroom,
      'Picnic Table': widget.communityFacilities.hasPicnicTable,
      'Grill': widget.communityFacilities.hasGrill,
      'Playground': widget.communityFacilities.hasPlayground,
      'Services': widget.communityFacilities.hasServices,
      'RV Camping': widget.communityFacilities.hasRVCamping,
      'Parking': widget.communityFacilities.hasParking,
      'Trail Path': widget.communityFacilities.hasTrailPath,
      'Camping Site': widget.communityFacilities.hasCampingSite,
      'Dog Park': widget.communityFacilities.hasDogPark,
    };

    final availableFacilities = communityFacilitiesMap.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    
    if (availableFacilities.isEmpty) {
      return const SizedBox.shrink(); // Returns an empty widget
    }

    final displayedFacilities = _isExpanded
        ? availableFacilities
        : availableFacilities.take(4).toList();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
            'Community Facilities',
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
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3,
            ),
            children: displayedFacilities
                .map((facilityName) => _buildCommunityFacilitiesBox(
                        facilityName: facilityName,
                        cardColor: cardColor,
                        textColor: textColor,
                        borderColor: borderColor,
                        primaryColor: primaryColor,
                    ))
                .toList(),
            ),
            if (availableFacilities.length >= 5)
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
                        _isExpanded ? 'See Less ' : 'See More ',
                        style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),
                    ),
                    Icon(
                        _isExpanded ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20, // Adjust the size to your liking
                    ),
                    ],
                ),
            ),
        ],
    );
  }

  Widget _buildCommunityFacilitiesBox({
    required String facilityName,
    required Color cardColor,
    required Color textColor,
    required Color borderColor,
    required Color primaryColor,
  }) {
    IconData? facilityIcon = _getCommunityIcon(facilityName);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
        color: cardColor,
      ),
      child: Row(
        children: [
          // Fixed-width container for the icon
          SizedBox(
            width: 40, // Set a fixed width for icon alignment
            child: FaIcon(
              facilityIcon,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 6), // Spacing between icon and text
          // Text expands to fill remaining space
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

  IconData? _getCommunityIcon(String service) {
    switch (service) {
      case 'Restroom':
        return FontAwesomeIcons.restroom;
      case 'Picnic Table':
        return FontAwesomeIcons.rug;
      case 'Grill':
        return FontAwesomeIcons.burger;
      case 'Playground':
        return FontAwesomeIcons.tree;
      case 'Services':
        return FontAwesomeIcons.aws;
      case 'RV Camping':
        return FontAwesomeIcons.caravan;
      case 'Parking':
        return FontAwesomeIcons.squareParking;
      case 'Trail Path':
        return FontAwesomeIcons.shoePrints;
      case 'Camping Site':
        return FontAwesomeIcons.tents;
      case 'Dog Park':
        return FontAwesomeIcons.dog;
      default:
        return null;
    }
  }
}
