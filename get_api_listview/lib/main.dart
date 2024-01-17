// Mengimpor package flutter/material.dart yang berisi widget dan fungsi yang diperlukan untuk membangun UI Flutter.
import 'package:flutter/material.dart';

// Mengimpor file home.dart yang berisi implementasi tampilan utama aplikasi.
import 'package:get_api_listview/screens/home.dart';

// Fungsi utama yang akan dijalankan saat aplikasi dimulai.
void main() => runApp(const MyApp());

// Kelas MyApp yang merupakan turunan dari StatelessWidget.
class MyApp extends StatelessWidget {
  // Konstruktor kelas MyApp.
  const MyApp({Key? key}) : super(key: key);

  // Metode build yang harus diimplementasikan dari StatelessWidget.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan MaterialApp, yang merupakan widget utama untuk membangun aplikasi Flutter.
    return MaterialApp(
      //menghilangkan banner debugging pada mode development
      debugShowCheckedModeBanner: false,
      // Judul aplikasi yang akan ditampilkan pada tampilan aplikasi.
      title: "Get Api Listview",

      // Tema aplikasi, termasuk warna utama (primarySwatch) yang digunakan dalam desain UI.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // Widget home yang akan ditampilkan saat aplikasi pertama kali dimulai.
      home: const Home(),
    );
  }
}
