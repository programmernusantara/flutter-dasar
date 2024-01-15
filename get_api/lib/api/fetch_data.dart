// Mengimpor pustaka dart:async untuk Future dan Timer.
import 'dart:async';

// Mengimpor pustaka dart:convert untuk JSON encoding/decoding.
import 'dart:convert';

// Mengimpor pustaka http untuk melakukan HTTP requests.
import 'package:http/http.dart' as http;

// Mengimpor model Album yang diperlukan.
import '../models/album_model.dart';

// Fungsi untuk mengambil data Album dari API
Future<Album> fetchAlbum() async {
  // Melakukan HTTP GET request ke endpoint 'https://jsonplaceholder.typicode.com/albums/1'.
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  // Memeriksa status code dari response.
  if (response.statusCode == 200) {
    // Jika server merespons dengan sukses (status code 200),
    // maka parse JSON dan kembalikan objek Album.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // Jika server tidak merespons dengan sukses,
    // maka lempar exception dengan pesan yang sesuai.
    throw Exception('Failed to load album');
  }
}
