class Event {
  final String name;
  final String parkName;
  final String city;
  final String state;
  final DateTime dateTime;
  final String description;

  Event({
    required this.name,
    required this.parkName,
    required this.city,
    required this.state,
    required this.dateTime,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      parkName: json['parkName'],
      city: json['city'],
      state: json['state'],
      dateTime: DateTime.parse(json['dateTime']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parkName': parkName,
      'city': city,
      'state': state,
      'dateTime': dateTime.toIso8601String(),
      'description': description,
    };
  }
}
