class County {
  final String id;  
  final String name; 
  final List<City> cities;

  County({
    required this.id,
    required this.name,
    required this.cities,
  });

  // Converts a County instance into a Firestore document
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cities': cities.map((city) => city.toMap()).toList(),
    };
  }

  // Factory method to create a County instance from Firestore data
  factory County.fromFirestore(Map<String, dynamic> data, String docId) {
    return County(
      id: data['id'],  
      name: data['name'],
      cities: (data['cities'] as List)
          .map((cityData) => City.fromFirestore(cityData))
          .toList(),
    );
  }
}