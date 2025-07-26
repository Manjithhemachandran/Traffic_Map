class TrafficCamera {
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String timestamp;

  TrafficCamera({
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  factory TrafficCamera.fromJson(Map<String, dynamic> json) {
    return TrafficCamera(
      imageUrl: json['image'] ?? '',
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
      timestamp: json['timestamp'],
    );
  }
}
