import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parks/models/park.dart';
import 'package:flutter/material.dart';

class ParkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Park>> getParks() async {
    List<Park> allParks = [];

    try {
      // Fetch all counties
      QuerySnapshot countiesSnapshot = await _firestore.collection('counties').get();

      for (QueryDocumentSnapshot countyDoc in countiesSnapshot.docs) {
        String countyId = countyDoc.id; // Extract county ID

        // Fetch all cities within the current county
        QuerySnapshot citiesSnapshot = await countyDoc.reference.collection('cities').get();

        for (QueryDocumentSnapshot cityDoc in citiesSnapshot.docs) {
          String cityId = cityDoc.id; // Extract city ID

          // Fetch all parks within the current city
          QuerySnapshot parksSnapshot = await cityDoc.reference.collection('parks').get();

          for (QueryDocumentSnapshot parkDoc in parksSnapshot.docs) {
            try {
              // Get park data and assign cityId and countyId dynamically
              Map<String, dynamic> parkData = parkDoc.data() as Map<String, dynamic>;
              parkData['cityId'] = cityId;
              parkData['countyId'] = countyId;

              // Create the Park object
              Park park = Park.fromFirestore(parkData);
              allParks.add(park);
            } catch (e) {
              debugPrint("Failed to parse park document with ID: ${parkDoc.id}");
              debugPrint("Error: $e");
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Error fetching parks: $e');
    }

    return allParks;
  }
}
