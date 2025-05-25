# 📄 Invoice OCR Scanner

A Flutter app that allows users to scan invoice images using **Google ML Kit Text Recognition**, extract key invoice information (Invoice Number, Date, and Total Amount), and export the data to a downloadable **PDF** file.

## ✨ Features

- 📷 Pick invoice images from the gallery.
- 🧠 Use Google ML Kit to extract text from images.
- 🔍 Extract structured invoice details:
  - Invoice Number
  - Date
  - Total Amount
- 📑 View full extracted text.
- 📤 Export the invoice to a beautifully formatted PDF.
- 💾 Download or print the generated PDF using the `printing` package.

## 📱 Screenshots

| Pick Image | Extracted Data | Export to PDF |
|------------|----------------|----------------|
| ![Pick](assets/screens/pick_image.png) | ![Data](assets/screens/invoice_data.png) | ![PDF](assets/screens/pdf_export.png) |

## 🛠️ Technologies Used

- [Flutter](https://flutter.dev/)
- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition)
- [image_picker](https://pub.dev/packages/image_picker)
- [pdf](https://pub.dev/packages/pdf)
- [printing](https://pub.dev/packages/printing)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / Xcode
- Android/iOS emulator or physical device

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/invoice-ocr-scanner.git
   cd invoice-ocr-scanner
