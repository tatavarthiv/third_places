import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parks/models/park_details/sports_facilities.dart';
import 'package:parks/models/park_details/community_facilities.dart';
import 'package:parks/models/park_details/accessibility.dart';
import 'package:parks/models/park_details/review.dart';
import 'package:parks/models/park_details/popular_times.dart';
import 'package:parks/models/park_details/opening_hours.dart';

class Park {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final GeoPoint coordinates;
  final List<Review> reviews;
  final List<OpeningHours> openingHours;
  final PopularTimes popularTimes;
  final SportsFacilities sportsFacilities;
  final Accessibility accessibility;
  final CommunityFacilities communityFacilities;
  final List<String> other;

  Park({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.coordinates,
    required this.reviews,
    required this.openingHours,
    required this.popularTimes,
    required this.sportsFacilities,
    required this.accessibility,
    required this.communityFacilities,
    required this.other,
  });

  factory Park.fromJson(Map<String, dynamic> json) {
    return Park(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown Park',
      location: json['location'] ?? '',
      imageUrl: json['imageUrl'] ?? 'https://st3.depositphotos.com/1186248/14351/i/450/depositphotos_143511907-stock-photo-not-available-rubber-stamp.jpg',
      coordinates: GeoPoint(
        json['latitude'] ?? 0.0,
        json['longitude'] ?? 0.0,
      ),
      reviews: [],
      popularTimes: PopularTimes(),
      openingHours: [],
      sportsFacilities: SportsFacilities(),
      communityFacilities: CommunityFacilities(),
      accessibility: Accessibility(),
      other: json['Other'] ?? [],
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
    var reviews = (data['reviews'] as List<dynamic>?)
        ?.map((reviewData) => Review.fromFirestore(
            reviewData as Map<String, dynamic>))
        .toList();
    var openingHours = (data['opening_hours'] as List<dynamic>?)
        ?.map((hoursData) => OpeningHours.fromFirestore(
            hoursData as Map<String, dynamic>))
        .toList();

    var popularTimes = PopularTimes.fromFirestore(
          data['popular_times'] as Map<String, dynamic>
    );
    
    var sportsFacilities = SportsFacilities.fromFirestore(
          data['Sports Facilities'] as Map<String, dynamic>
    );

    var communityFacilities = CommunityFacilities.fromFirestore(
      data['Community Facilities'] as Map<String, dynamic>
    );

    var accessibility = Accessibility.fromFirestore(
      data['Accessibility'] as Map<String, dynamic>
    );

    var location = data['location']?['address'] as String?;
    var longitude = data['location']?['longitude'] as double?;
    var latitude = data['location']?['latitude'] as double?;
    
    GeoPoint coordinates;
    if (longitude != null && latitude != null) {
      coordinates = GeoPoint(latitude, longitude);
    } else {
      coordinates = GeoPoint(0.0, 0.0);
    }
      
    return Park(
      id: data['id'] ?? '',
      name: data['name'] ?? 'Unknown Park',
      location: location ?? '',
      imageUrl: data['imageUrl'] ?? 'https://st3.depositphotos.com/1186248/14351/i/450/depositphotos_143511907-stock-photo-not-available-rubber-stamp.jpg',
      coordinates: coordinates,
      reviews: reviews ?? [],
      openingHours: openingHours ?? [],
      popularTimes: popularTimes ?? PopularTimes(),
      sportsFacilities: sportsFacilities ?? SportsFacilities(),
      communityFacilities: communityFacilities ?? CommunityFacilities(),
      accessibility: accessibility ?? Accessibility(),
      other: List<String>.from(data['Other'] ?? []),
    );
  }
}
