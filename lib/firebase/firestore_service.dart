import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parks/models/park.dart';
import 'package:flutter/material.dart';

class ParkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Park>> getParks() async {
    try {
      // Fetch the 'counties' collection
      QuerySnapshot countiesSnapshot = await _firestore.collection('counties').get();

      // Iterate through the documents and print their IDs
      for (QueryDocumentSnapshot county in countiesSnapshot.docs) {
        String countyId = county.id;
        debugPrint('County ID: $countyId');
      }
    } catch (e) {
      debugPrint('Error fetching counties: $e');
    }
    try {
      QuerySnapshot countySnapshot = await _firestore
        .collection('counties') 
        .doc('Alameda') 
        .collection('cities') 
        .doc('Alameda') 
        .collection('parks') 
        .get();

      List<Park> allParks = [];

    countySnapshot.docs.forEach((doc) {
      try {
        Park park = Park.fromFirestore(doc.data() as Map<String, dynamic>);
        allParks.add(park);
        
      } catch (e) {
        debugPrint("Failed to parse park document with ID: ${doc.id}");
        debugPrint("Error: $e");
      }
    });

      return allParks; 
    } catch (e) {
      throw Exception("Error fetching parks: $e");
    }
  }
}
