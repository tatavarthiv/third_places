import 'package:flutter/material.dart';
import 'package:parks/firebase/firestore_service.dart';
import 'package:parks/models/park.dart';
import 'package:parks/widgets/explore/explore_search_bar.dart';
import 'package:parks/widgets/explore/park_card_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Unfocus search bar and dismiss keyboard
        },
        child: Column(children: [
          const ExploreSearchBar(),
          Expanded(
            child: FutureBuilder<List<Park>>(
                future: ParkService().getParks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final parks = snapshot.data!;
                    return ParksCardList(parks: parks);
                  } else {
                    return const Center(child: Text('No parks found.'));
                  }
                }),
          ),
        ]),
      ),
    ));
  }
}
