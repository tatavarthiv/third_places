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
