class ParkEvent {
  final String id;
  final String title;
  final String date;
  final String location;
  final String parkName;
  final String parkType;
  final String parkSize;
  final String description;
  final String imageUrl;
  final bool isOfficial;
  final List<String> tags;

  ParkEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.parkName,
    required this.parkType,
    required this.parkSize,
    required this.description,
    required this.imageUrl,
    this.isOfficial = false,
    this.tags = const [],
  });
}
