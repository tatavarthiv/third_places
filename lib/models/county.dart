import 'package:parks/models/city.dart';

class County {
  final String countyId;
  final List<City> cities;

  County({
    required this.countyId,
    required this.cities,
  });

  factory County.fromFirestore(Map<String, dynamic> data) {
    var citiesList = (data['cities'] as List?)
            ?.map((cityData) => City.fromFirestore(cityData as Map<String, dynamic>))
            .toList() ??
        [];

    return County(
      countyId: data['county_id'] ?? '',
      cities: citiesList,
    );
  }
}
