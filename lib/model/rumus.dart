class Rumus {
  final int id;
  final String nama;
  final String deskripsi;
  final String rumus;

  Rumus({required this.id, required this.nama, required this.deskripsi, required this.rumus});

  factory Rumus.fromJson(Map<String, dynamic> json) {
    return Rumus(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      rumus: json['rumus'],
    );
  }
}