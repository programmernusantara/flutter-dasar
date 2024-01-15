// Model: Album
class Album {
  // Properti yang menyimpan data album
  final int userId;
  final int id;
  final String title;

  // Konstruktor untuk membuat objek Album
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // Fungsi factory untuk membuat objek Album dari data JSON
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      // Mengambil nilai 'userId' dari JSON dan mengkonversikannya ke tipe int
      userId: json['userId'] as int,

      // Mengambil nilai 'id' dari JSON dan mengkonversikannya ke tipe int
      id: json['id'] as int,

      // Mengambil nilai 'title' dari JSON dan mengkonversikannya ke tipe String
      title: json['title'] as String,
    );
  }
}
