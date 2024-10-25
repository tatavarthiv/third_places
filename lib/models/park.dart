import 'package:cloud_firestore/cloud_firestore.dart';

class Park {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final GeoPoint coordinates;

  Park({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.coordinates,
  });

  factory Park.fromJson(Map<String, dynamic> json) {
    return Park(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      coordinates: GeoPoint(
        json['latitude'] ?? 0.0,
        json['longitude'] ?? 0.0,
      ),
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
      coordinates: data['coordinates'] ?? const GeoPoint(0.0, 0.0),
    );
  }
}
