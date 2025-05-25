import 'package:flutter/material.dart';

import 'info_card.dart';

class RecognizedTextView extends StatelessWidget {
  final String? invoiceNumber;
  final String? totalAmount;
  final String? date;
  final String fullText;

  const RecognizedTextView({
    required this.invoiceNumber,
    required this.totalAmount,
    required this.date,
    required this.fullText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCard(title: 'Invoice Number', value: invoiceNumber),
          InfoCard(title: 'Date', value: date),
          InfoCard(title: 'Total Amount', value: totalAmount != null ? '\$$totalAmount' : null),
          const SizedBox(height: 16),
          const Text('Full Recognized Text:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(fullText, style: const TextStyle(fontSize: 14, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
