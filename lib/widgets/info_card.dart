import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? value;

  const InfoCard({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.info_outline, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value ?? 'Not Found', style: const TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}