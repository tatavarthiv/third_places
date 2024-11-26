class SportsFacilities {
  final bool hasBaseball;
  final bool hasTennis;
  final bool hasBasketball;
  final bool hasVolleyball;
  final bool hasGolf;
  final bool hasFitnessCenter;
  final bool hasSkateboarding;

  SportsFacilities({
    this.hasBaseball = false,
    this.hasTennis = false,
    this.hasBasketball = false,
    this.hasVolleyball = false,
    this.hasGolf = false,
    this.hasFitnessCenter = false,
    this.hasSkateboarding = false,
  });

  factory SportsFacilities.fromFirestore(Map<String, dynamic> data) {
    return SportsFacilities(
      hasBaseball: (data['Baseball'] is List && (data['Baseball'] as List).isNotEmpty),
      hasTennis: (data['Tennis'] is List && (data['Tennis'] as List).isNotEmpty),
      hasBasketball: (data['Basketball'] is List && (data['Basketball'] as List).isNotEmpty),
      hasVolleyball: (data['Volleyball'] is List && (data['Volleyball'] as List).isNotEmpty),
      hasGolf: (data['Golf'] is List && (data['Golf'] as List).isNotEmpty),
      hasFitnessCenter: (data['Fitness Center'] is List && (data['Fitness Center'] as List).isNotEmpty),
      hasSkateboarding: (data['Skateboarding'] is List && (data['Skateboarding'] as List).isNotEmpty),
    );
  }
}