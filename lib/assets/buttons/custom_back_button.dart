import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  final double size;

  const CustomBackButton({
    super.key,
    this.color = Colors.white,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 30, height: 30),
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: color, size: size),
        onPressed: () {
          Navigator.of(context).pop();
        },
        padding: const EdgeInsets.all(6.0),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
