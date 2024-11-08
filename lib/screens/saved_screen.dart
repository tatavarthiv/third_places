import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/providers/saved_events_provider.dart';
import 'package:parks/providers/saved_parks_provider.dart';
import 'package:parks/widgets/explore/park_card_view.dart';
import 'package:parks/widgets/community/event_card.dart';

class SavedScreen extends ConsumerStatefulWidget {
  const SavedScreen({super.key});

  @override
  ConsumerState<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends ConsumerState<SavedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final savedParks = ref.watch(savedParksProvider);
    final savedEvents = ref.watch(savedEventsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Saved',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
              ),
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: _tabController,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                indicatorColor: colorScheme.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                tabs: const [
                  Tab(text: 'Parks'),
                  Tab(text: 'Events'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Parks Tab
                  savedParks.isEmpty
                      ? Center(
                          child: Text(
                            'No saved parks yet',
                            style:
                                TextStyle(color: colorScheme.onSurfaceVariant),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: savedParks.length,
                          itemBuilder: (context, index) {
                            return ParkCard(park: savedParks[index]);
                          },
                        ),

                  // Events Tab
                  savedEvents.isEmpty
                      ? Center(
                          child: Text(
                            'No saved events yet',
                            style:
                                TextStyle(color: colorScheme.onSurfaceVariant),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: savedEvents.length,
                          itemBuilder: (context, index) {
                            return EventCard(event: savedEvents[index]);
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
