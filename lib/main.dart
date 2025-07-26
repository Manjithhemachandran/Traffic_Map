import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/traffic_provider.dart';
import 'views/map_screen.dart';

void main() {
  runApp(const TrafficConditionMapApp());
}

class TrafficConditionMapApp extends StatelessWidget {
  const TrafficConditionMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrafficProvider()..fetchTrafficData(),
      child: MaterialApp(
        title: 'Traffic Condition Map',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const MapScreen(),
      ),
    );
  }
}
