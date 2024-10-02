import 'package:flutter/material.dart';
import 'package:parks/models/park.dart';
import 'package:parks/widgets/explore/explore_search_bar.dart';
import 'package:parks/widgets/explore/park_card_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample park data
    final List<Park> parks = [
      Park(
          name: 'Greenwood Park',
          location: 'New York, NY',
          imageUrl:
              'https://images.squarespace-cdn.com/content/v1/5fe120bdfce3cd3cca992359/1610954254015-SPCW0G52IND5A1V1AZ8B/mg_9574-small-1091x488.jpg'),
      Park(
          name: 'Lakeside Park',
          location: 'Chicago, IL',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/e/ec/LakeViewIA_LakesidePark1.jpg'),
      // Add more parks here
    ];

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .unfocus(); // Unfocus search bar and dismiss keyboard
          },
          child: Column(
            children: [
              const ExploreSearchBar(),
              Expanded(
                child: ParksCardList(parks: parks),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
