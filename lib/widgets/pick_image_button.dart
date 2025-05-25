import 'package:flutter/material.dart';

class PickImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PickImageButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.image_search, color: Colors.white),
      label: const Text('Pick Image & Recognize Text', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
