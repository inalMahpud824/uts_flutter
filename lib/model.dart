class Akun {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Akun({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Akun.fromJson(Map<String, dynamic> json) {
    return Akun(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
