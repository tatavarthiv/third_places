import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parks/models/park.dart';

class ParkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Park>> getParks() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('parks-data').get();

      // Map Firestore documents to Park models
      return querySnapshot.docs.map((doc) {
        return Park.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Error fetching parks: $e");
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class CountyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<County>> getCounties() async {
    List<County> allCounties = [];

    try {
      // Get all documents in the top-level 'counties' collection
      QuerySnapshot countiesSnapshot = await _firestore.collection('counties').get();

      // Iterate over each county document
      for (QueryDocumentSnapshot countyDoc in countiesSnapshot.docs) {
        // List to hold the cities of each county
        List<City> citiesList = [];

        // Get the subcollections (cities) for each county
        QuerySnapshot citiesSnapshot = await countyDoc.reference.collection('cities').get();

        // Iterate over each city in the subcollection
        for (QueryDocumentSnapshot cityDoc in citiesSnapshot.docs) {
          // List to hold parks of the current city
          List<Park> parksList = [];

          // Get the parks in the current city
          QuerySnapshot parksSnapshot = await cityDoc.reference.collection('parks').get();

          // Map each park document to a Park object
          for (QueryDocumentSnapshot parkDoc in parksSnapshot.docs) {
            parksList.add(Park.fromMap(parkDoc.data() as Map<String, dynamic>));
          }

          // Create City object and add it to citiesList
          citiesList.add(City.fromMap(cityDoc.data() as Map<String, dynamic>, parksList));
        }

        // Create County object and add it to allCounties
        allCounties.add(County.fromMap(countyDoc.data() as Map<String, dynamic>, citiesList));
      }

      return allCounties;
    } catch (e) {
      throw Exception("Error fetching data from Firestore: $e");
    }
  }
}
