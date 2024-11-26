class Accessibility {
  final bool isWheelchairFriendly;
  final bool isPetFriendly;
  final bool isKidFriendly;
  final bool hasVolleyball;
  final bool isLGBTQFriendly;
  final bool isFamilyFriendly;

  Accessibility({
    this.isWheelchairFriendly = false,
    this.isPetFriendly = false,
    this.isKidFriendly = false,
    this.hasVolleyball = false,
    this.isLGBTQFriendly = false,
    this.isFamilyFriendly = false,
  });

  factory Accessibility.fromFirestore(Map<String, dynamic> data) {
    return Accessibility(
      isWheelchairFriendly: (data['Wheelchair Friendly'] is List && (data['Wheelchair Friendly'] as List).isNotEmpty),
      isPetFriendly: (data['Pet Friendly'] is List && (data['Pet Friendly'] as List).isNotEmpty),
      isKidFriendly: (data['Kid Friendly'] is List && (data['Kid Friendly'] as List).isNotEmpty),
      isLGBTQFriendly: (data['LGBTQ+ Friendly'] is List && (data['LGBTQ+ Friendly'] as List).isNotEmpty),
      isFamilyFriendly: (data['Family Friendly'] is List && (data['Family Friendly'] as List).isNotEmpty),
    );
  }
}