import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/traffic_camera.dart';

class TrafficService {
  Future<List<TrafficCamera>> fetchTrafficCameras() async {
    const url = 'https://api.data.gov.sg/v1/transport/traffic-images';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final cameras = jsonData['items'][0]['cameras'] as List;
      return cameras.map((json) => TrafficCamera.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load traffic images');
    }
  }
}
