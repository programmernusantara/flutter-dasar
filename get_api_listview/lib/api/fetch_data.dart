// Mengimpor pustaka dart:async untuk Future dan Timer.
import 'dart:async';

// Mengimpor pustaka dart:convert untuk JSON encoding/decoding.
import 'dart:convert';

// Mengimpor pustaka http untuk melakukan HTTP requests.
import 'package:get_api_listview/models/album_model.dart';
import 'package:http/http.dart' as http;

// Mengimpor model User yang diperlukan.

// Fungsi asinkron untuk mengambil data users dari API
Future<List<User>> getusers() async {
  // URL endpoint untuk mendapatkan data users dari API
  var url = Uri.parse("https://reqres.in/api/users?page=2");

  // Melakukan HTTP GET request untuk mendapatkan data dari API
  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  // Memeriksa apakah request berhasil (kode status 200)
  if (response.statusCode == 200) {
    // Mengkonversi respons JSON menjadi map
    final Map<String, dynamic> responseBody = json.decode(response.body);

    // Mengambil data users dari atribut 'data' pada map
    final List<dynamic> usersData = responseBody['data'];

    // Menggunakan map dan fungsi fromJson untuk mengonversi data JSON menjadi objek User
    return usersData.map((e) => User.fromJson(e)).toList();
  } else {
    // Jika request tidak berhasil, lempar Exception dengan pesan kesalahan
    throw Exception('Failed to load users');
  }
}
