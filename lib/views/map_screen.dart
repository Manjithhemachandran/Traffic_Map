import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/traffic_provider.dart';
import '../widgets/traffic_image_dialog.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TrafficProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Traffic Condition Map'),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.4),
        elevation: 0,
      ),
      body: Stack(
        children: [
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(1.3521, 103.8198),
                    zoom: 11,
                  ),
                  markers: provider.cameras.map((camera) {
                    return Marker(
                      markerId: MarkerId(camera.imageUrl),
                      position: LatLng(camera.latitude, camera.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => TrafficImageDialog(camera: camera),
                        );
                      },
                    );
                  }).toSet(),
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  buildingsEnabled: true,
                ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                // Add your refresh or recenter logic
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
