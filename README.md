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
| ![WhatsApp Image 2025-05-25 at 12 33 56 PM](https://github.com/user-attachments/assets/c581ea6e-28af-4e37-b783-427b070d0a28) | ![WhatsApp Image 2025-05-25 at 12 33 52 PM](https://github.com/user-attachments/assets/05094647-8283-45f6-91f3-1aa469ee5017) | ![WhatsApp Image 2025-05-25 at 12 33 53 PM](https://github.com/user-attachments/assets/0c815305-194b-4929-8615-71e5a5767f73) |

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
