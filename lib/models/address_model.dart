class AddressModel {
  final String displayName;
  final double latitude;
  final double longitude;

  AddressModel({
    required this.displayName,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      displayName: json['display_name'] ?? '',
      latitude: double.parse(json['lat']),
      longitude: double.parse(json['lon']),
    );
  }
}