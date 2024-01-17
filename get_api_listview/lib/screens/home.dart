// Mengimpor package flutter/material.dart yang berisi widget dan fungsi yang diperlukan untuk membangun UI Flutter.
import 'package:flutter/material.dart';

// Mengimpor file fetch_data.dart yang berisi fungsi untuk mengambil data dari API.
import 'package:get_api_listview/api/fetch_data.dart';

// Mengimpor file album_model.dart yang berisi model data Album.
import 'package:get_api_listview/models/album_model.dart';

// Kelas Home yang merupakan StatefulWidget, artinya dapat memiliki state yang dapat berubah.
class Home extends StatefulWidget {
  // Konstruktor kelas Home.
  const Home({Key? key}) : super(key: key);

  // Metode createState() digunakan untuk membuat state baru untuk widget ini.
  @override
  State<Home> createState() => _HomeState();
}

// Kelas _HomeState adalah state untuk kelas Home.
class _HomeState extends State<Home> {
  // Variabel Future untuk menyimpan data yang akan diambil dari API
  late Future<List<User>>
      userFuture; // Ganti tipe Future<User> dengan Future<List<User>>

  // Metode initState dijalankan saat state pertama kali dibuat.
  @override
  void initState() {
    super.initState();
    // Memanggil fungsi getusers() untuk mengambil data dari API
    userFuture = getusers(); // Ganti fetchU() dengan getusers()
  }

  // Metode untuk membangun tampilan halaman Home
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar aplikasi
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 139, 240),
        title: const Text("Nusantara"),
      ),
      // Isi utama halaman, menggunakan FutureBuilder untuk menangani state data yang masih diambil
      body: Center(
        child: FutureBuilder<List<User>>(
          // Future yang diambil dari userFuture
          future: userFuture,
          // Metode builder untuk membangun UI berdasarkan state Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Jika data masih diambil, tampilkan indikator loading
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // Jika data telah diterima, tampilkan data menggunakan buildPosts
              final users = snapshot.data!;
              return buildPosts(users);
            } else if (snapshot.hasError) {
              // Jika terjadi error, tampilkan pesan error
              return Text('Error: ${snapshot.error}');
            } else {
              // Jika tidak ada data, tampilkan pesan "No data available"
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  // Metode untuk membangun tampilan berdasarkan data pengguna
  Widget buildPosts(List<User> users) {
    // Menggunakan ListView.builder untuk membuat daftar item berbasis data
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, index) {
          // Membungkus setiap item dalam Card dan ListTile untuk tampilan yang lebih baik
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
                color: Theme.of(context).primaryColor,
                child: ListTile(
                    // Menampilkan nama pengguna dan email
                    title: Text(
                      '${users[index].firstName}  ${users[index].lastName}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${users[index].email}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    // Menampilkan avatar pengguna
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(users[index].avatar.toString()),
                    ))),
          );
        });
  }
}
