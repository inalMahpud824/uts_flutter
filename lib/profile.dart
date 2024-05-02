class Profile {
  final int id;
  final String name;
  final String provinsi;
  final String kabupaten;
  final double latitude;
  final double longitude;
  final String? image;

  Profile(
      {required this.id,
      required this.name,
      required this.provinsi,
      required this.kabupaten,
      required this.latitude,
      required this.longitude,
       this.image});

   factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'],
        name: json['name'],
        provinsi: json['provinsi'],
        kabupaten: json['kabupaten'],
        latitude: json['latitude'],
        longitude: json['longtitude'],
        image: json['image']);
  }
}
