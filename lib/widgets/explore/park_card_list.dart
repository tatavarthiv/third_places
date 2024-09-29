import 'package:flutter/material.dart';
import 'package:parks/models/park.dart';
import 'package:parks/widgets/explore/park_card_view.dart';

class ParksCardList extends StatelessWidget {
  final List<Park> parks;

  const ParksCardList({super.key, required this.parks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: parks.length,
      itemBuilder: (context, index) {
        return ParkCard(park: parks[index]);
      },
    );
  }
}
