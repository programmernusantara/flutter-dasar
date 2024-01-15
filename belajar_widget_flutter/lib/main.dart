// Import library 'flutter/material.dart' yang diperlukan untuk menggunakan komponen Flutter.
import 'package:flutter/material.dart';

// Fungsi utama aplikasi Flutter.
void main() {
  // Menjalankan aplikasi Flutter.
  runApp(
    // Menggunakan widget 'Center' untuk mengatur teks ke tengah layar.
    const Center(
      // Menggunakan widget 'Text' untuk menampilkan teks.
      child: Text(
        "Assalamualaikum",
        // Mengatur arah teks dari kiri ke kanan.
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
