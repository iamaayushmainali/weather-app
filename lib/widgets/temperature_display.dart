import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TemperatureDisplay extends StatelessWidget {
  final double temperature;
  final String condition;

  const TemperatureDisplay({
    required this.condition,
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formatedDate = DateFormat.yMMMMd().format(DateTime.now());

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature.round().toString(),
              style: const TextStyle(
                fontSize: 110,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 0.95,
                letterSpacing: -2,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, left: 4),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.65),
                  width: 3.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Text(
          condition,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 6),

        Text(
          formatedDate,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.75),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
