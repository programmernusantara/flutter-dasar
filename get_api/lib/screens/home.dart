// Mengimpor package flutter/material.dart yang berisi widget dan fungsi yang diperlukan untuk membangun UI Flutter.
import 'package:flutter/material.dart';

// Mengimpor file fetch_data.dart yang berisi fungsi untuk mengambil data dari API.
import 'package:get_api/api/fetch_data.dart';

// Mengimpor file album_model.dart yang berisi model data Album.
import 'package:get_api/models/album_model.dart';

// Kelas Home yang merupakan StatefulWidget, artinya dapat memiliki state yang dapat berubah.
class Home extends StatefulWidget {
  // Konstruktor kelas Home.
  const Home({Key? key}) : super(key: key);

  // Metode createState() digunakan untuk membuat state baru untuk widget ini.
  @override
  State<Home> createState() => _HomeState();
}

// Kelas _HomeState yang merupakan state dari widget Home.
class _HomeState extends State<Home> {
  // Membuat variabel futureAlbum yang merupakan Future yang akan berisi data Album.
  late Future<Album> futureAlbum;

  // Metode initState() dipanggil saat state pertama kali diinisialisasi.
  @override
  void initState() {
    super.initState();

    // Memanggil fungsi fetchAlbum() untuk mengambil data Album dari API.
    futureAlbum = fetchAlbum();
  }

  // Metode build() digunakan untuk merender tampilan UI dari widget ini.
  @override
  Widget build(BuildContext context) {
    // Scaffold adalah kerangka kerja tata letak dasar dari aplikasi Flutter.
    return Scaffold(
      // AppBar adalah elemen tata letak yang menampilkan bar atas di aplikasi.
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // Judul yang akan ditampilkan di AppBar.
        title: const Text('Get Rest Api'),
      ),
      // Body dari tampilan utama aplikasi.
      body: Center(
        // Widget FutureBuilder digunakan untuk membuat UI berdasarkan hasil Future.
        child: FutureBuilder<Album>(
          // Future yang akan digunakan sebagai sumber data.
          future: futureAlbum,
          // Builder yang akan dijalankan ketika Future selesai.
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Menampilkan title dari album jika data tersedia.
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              // Menampilkan pesan error jika terjadi kesalahan.
              return Text('${snapshot.error}');
            }

            // Menampilkan indikator loading jika data masih diambil.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
