import 'package:flutter/material.dart';
import '../models/traffic_camera.dart';
import '../services/traffic_service.dart';

class TrafficProvider with ChangeNotifier {
  final TrafficService _service = TrafficService();

  List<TrafficCamera> _cameras = [];
  bool _loading = false;

  List<TrafficCamera> get cameras => _cameras;
  bool get isLoading => _loading;

  Future<void> fetchTrafficData() async {
    _loading = true;
    notifyListeners();
    try {
      _cameras = await _service.fetchTrafficCameras();
    } catch (e) {
      _cameras = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
