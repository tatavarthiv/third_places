class CommunityFacilities {
  final bool hasRestroom;
  final bool hasPicnicTable;
  final bool hasGrill;
  final bool hasPlayground;
  final bool hasServices;
  final bool hasRVCamping;
  final bool hasParking;
  final bool hasTrailPath;
  final bool hasCampingSite;
  final bool hasDogPark;

  CommunityFacilities({
    this.hasRestroom = false,
    this.hasPicnicTable = false,
    this.hasGrill = false,
    this.hasPlayground = false,
    this.hasServices = false,
    this.hasRVCamping = false,
    this.hasParking = false,
    this.hasTrailPath = false,
    this.hasCampingSite = false,
    this.hasDogPark = false,
  });

  factory CommunityFacilities.fromFirestore(Map<String, dynamic> data) {
    return CommunityFacilities(
      hasRestroom: (data['Restroom'] is List && (data['Restroom'] as List).isNotEmpty),
      hasPicnicTable: (data['Picnic Table'] is List && (data['Picnic Table'] as List).isNotEmpty),
      hasGrill: (data['Barbecue grill'] is List && (data['Barbecue grill'] as List).isNotEmpty),
      hasPlayground: (data['Playground'] is List && (data['Playground'] as List).isNotEmpty),
      hasServices: (data['On-site services'] is List && (data['On-site services'] as List).isNotEmpty),
      hasRVCamping: (data['RV Camping'] is List && (data['RV Camping'] as List).isNotEmpty),
      hasParking: (data['On-site parking'] is List && (data['On-site parking'] as List).isNotEmpty),
      hasTrailPath: (data['Trail path'] is List && (data['Trail path'] as List).isNotEmpty),
      hasCampingSite: (data['Camping Site'] is List && (data['Camping Site'] as List).isNotEmpty),
      hasDogPark: (data['Dog Park'] is List && (data['Dog Park'] as List).isNotEmpty),
    );
  }
}