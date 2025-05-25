import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/pick_image_button.dart';
import '../widgets/recognized_text_view.dart';

class TextRecognizerScreen extends StatefulWidget {
  const TextRecognizerScreen({super.key});

  @override
  State<TextRecognizerScreen> createState() => _TextRecognizerScreenState();
}

class _TextRecognizerScreenState extends State<TextRecognizerScreen> {
  String? invoiceNumber;
  String? totalAmount;
  String? date;
  String _recognizedText = '';

  Future<void> _pickImageAndRecognizeText() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;

    final inputImage = InputImage.fromFile(File(pickedFile.path));
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );
    await textRecognizer.close();

    final lines =
        recognizedText.blocks
            .expand((b) => b.lines.map((l) => l.text))
            .toList();

    String? newInvoiceNumber;
    String? newTotalAmount;
    String? newDate;

    final invoiceRegEx = RegExp(
      r'Invoice\s+No[:\s]*([0-9]+)',
      caseSensitive: false,
    );
    final totalRegEx = RegExp(
      r'Total[:\s]*\$?([0-9]+\.[0-9]{2})',
      caseSensitive: false,
    );
    final dateRegEx = RegExp(
      r'Date[:\s]*([0-9]{4}-[0-9]{2}-[0-9]{2})',
      caseSensitive: false,
    );

    for (final line in lines) {
      newInvoiceNumber ??= invoiceRegEx.firstMatch(line)?.group(1);
      newTotalAmount ??= totalRegEx.firstMatch(line)?.group(1);
      newDate ??= dateRegEx.firstMatch(line)?.group(1);
    }

    setState(() {
      invoiceNumber = newInvoiceNumber;
      totalAmount = newTotalAmount;
      date = newDate;
      _recognizedText = recognizedText.text;
    });
  }

  Future<void> _generateAndSavePdf() async {
    if (invoiceNumber == null || totalAmount == null || date == null) return;

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build:
            (context) => pw.Padding(
              padding: const pw.EdgeInsets.all(16),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Invoice',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text('Invoice Number: $invoiceNumber'),
                  pw.Text('Date: $date'),
                  pw.Text('Total Amount: \$$totalAmount'),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.Text(
                    'Full Recognized Text:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(_recognizedText),
                ],
              ),
            ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onGeneratePdf: _generateAndSavePdf),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PickImageButton(onPressed: _pickImageAndRecognizeText),
            const SizedBox(height: 20),
            if (_recognizedText.isNotEmpty)
              Expanded(
                child: RecognizedTextView(
                  invoiceNumber: invoiceNumber,
                  totalAmount: totalAmount,
                  date: date,
                  fullText: _recognizedText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
