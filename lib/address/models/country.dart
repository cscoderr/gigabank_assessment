class Country {
  Country({
    required this.name,
    required this.code,
    this.emoji,
    this.unicode,
    this.image,
  });
  final String name;
  final String code;
  final String? emoji;
  final String? unicode;
  final String? image;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String,
      code: json['code'] as String,
      emoji: json['emoji'] as String?,
      unicode: json['unicode'] as String?,
      image: json['image'] as String?,
    );
  }
}
