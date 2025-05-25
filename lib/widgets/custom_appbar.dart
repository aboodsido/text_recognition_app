import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onGeneratePdf;

  const CustomAppBar({required this.onGeneratePdf, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: const Text('Invoice OCR Scanner', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.green,
      actions: [
        IconButton(
          onPressed: onGeneratePdf,
          icon: const Icon(Icons.receipt_long, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}