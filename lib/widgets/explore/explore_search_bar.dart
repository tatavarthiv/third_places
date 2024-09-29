import 'package:flutter/material.dart';

class ExploreSearchBar extends StatefulWidget {
  const ExploreSearchBar({super.key});

  @override
  _ExploreSearchBarState createState() => _ExploreSearchBarState();
}

class _ExploreSearchBarState extends State<ExploreSearchBar> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (text) {
          setState(() {
            searchText = text;
          });
        },
        decoration: const InputDecoration(
          labelText: "Search",
          hintText: "Find parks",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
