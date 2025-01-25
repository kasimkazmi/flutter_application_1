class Airport {
  final String name;
  final String code;
  final String detailedName;
  final String timeZoneOffset;
  final double latitude;
  final double longitude;
  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String stateCode;

  Airport({
    required this.name,
    required this.code,
    required this.detailedName,
    required this.timeZoneOffset,
    required this.latitude,
    required this.longitude,
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.stateCode,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      name: json['name'] ?? 'Unknown',
      code: json['iataCode'] ?? 'N/A',
      detailedName: json['detailedName'] ?? 'Not Available',
      timeZoneOffset: json['timeZoneOffset'] ?? 'Not Available',
      latitude: json['geoCode']?['latitude'] ?? 0.0,
      longitude: json['geoCode']?['longitude'] ?? 0.0,
      cityName: json['address']?['cityName'] ?? 'Unknown',
      cityCode: json['address']?['cityCode'] ?? 'N/A',
      countryName: json['address']?['countryName'] ?? 'Unknown',
      countryCode: json['address']?['countryCode'] ?? 'N/A',
      stateCode: json['address']?['stateCode'] ?? 'N/A',
    );
  }
}
