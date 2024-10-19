import 'package:flutter/material.dart';
import 'package:parks/assets/buttons/custom_back_button.dart';
import 'package:parks/assets/custom_save_button.dart';
import 'package:parks/models/park.dart';

class ParkCardContentScreen extends StatelessWidget {
  final Park park;

  const ParkCardContentScreen({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(
                park.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 250),
                      Text(
                        park.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Location: ${park.location}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 55,
            left: 16,
            child: CustomBackButton(),
          ),
          Positioned(
            top: 55,
            right: 16,
            child: CustomSaveParkButton(park: park),
          ),
        ],
      ),
    );
  }
}
