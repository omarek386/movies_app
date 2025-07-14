class Suggestions {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  Suggestions({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory Suggestions.fromJson(Map<String, dynamic> json) {
    return Suggestions(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      url: json['url'],
    );
  }
}
