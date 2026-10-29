import 'package:flutter/material.dart';

import 'metric_tile.dart';

class BottomBar extends StatelessWidget {
  final double windSpeed;
  final int humidity;

  const BottomBar({required this.windSpeed, required this.humidity, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.white.withOpacity(0.15), thickness: 1),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MetricTile(
              icon: Icons.air_rounded,
              value: "${windSpeed.toStringAsFixed(1)} km/h",
              label: 'Wind',
            ),
            MetricTile(
              icon: Icons.water_drop_rounded,
              value: '$humidity%',
              label: 'Humidity',
            ),
            MetricTile(
              icon: Icons.grain_rounded,
              value: '87%',
              label: 'Chance of rain',
            ),
          ],
        ),
      ],
    );
  }
}
