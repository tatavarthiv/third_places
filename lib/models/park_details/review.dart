import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final DateTime date;
  final String text;

  Review({
    required this.date,
    this.text = '',
  });

  factory Review.fromFirestore(Map<String, dynamic> data) {
    return Review(
      date: data['date'].toDate() ?? DateTime(1970, 1, 1),
      text: data['text'] as String ?? '',
    );
  }
}