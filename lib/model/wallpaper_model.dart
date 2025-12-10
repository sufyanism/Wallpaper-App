class Wallpaper {
  final int id;
  final String name;
  final String url;

  Wallpaper({required this.id, required this.name, required this.url});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
