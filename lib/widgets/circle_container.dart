import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final String imagePath;

  const CircleContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFEBC755), width: 2),
      ),
      child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.contain)),
    );
  }
}
