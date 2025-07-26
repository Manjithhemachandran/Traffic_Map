import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/traffic_camera.dart';

class TrafficImageDialog extends StatelessWidget {
  final TrafficCamera camera;

  const TrafficImageDialog({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Traffic Camera Image"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: camera.imageUrl,
            placeholder: (_, __) => const CircularProgressIndicator(),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
          const SizedBox(height: 8),
          Text("Captured at: ${camera.timestamp}"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
