class Park {
  final String id;
  final String name;
  final String location;
  final String imageUrl;

  Park({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  factory Park.fromJson(Map<String, dynamic> json) {
    return Park(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
    };
  }

  // Map Firestore data to the Park model
  factory Park.fromFirestore(Map<String, dynamic> data) {
    return Park(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
