import 'package:parks/models/park.dart';

class City {
  final String cityId;
  final List<Park> parks;

  City({
    required this.cityId,
    required this.parks,
  });

  factory City.fromFirestore(Map<String, dynamic> data) {
    var parksList = (data['parks'] as List?)
            ?.map((parkData) => Park.fromFirestore(parkData as Map<String, dynamic>))
            .toList() ??
        [];

    return City(
      cityId: data['cityid'] ?? '',
      parks: parksList,
    );
  }
}
