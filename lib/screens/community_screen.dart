import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: [
            // Scrollable row for upcoming events
            SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Container(
                    width: 100.0,
                    margin: const EdgeInsets.all(8.0),
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        'Event ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Tab bar
            TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontSize: 12.0),
              unselectedLabelStyle: const TextStyle(fontSize: 12.0),
              tabs: const [
                Tab(text: 'Your Community'),
                Tab(text: 'City Events'),
                Tab(text: 'Events by Friends'),
              ],
            ),
            // Tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent(context, 'Your Community'),
                  _buildTabContent(context, 'City Events'),
                  _buildTabContent(context, 'Events by Friends'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, String title) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('$title Event ${index + 1}'),
            subtitle: Text('Details for $title Event ${index + 1}'),
          ),
        );
      },
    );
  }
}
