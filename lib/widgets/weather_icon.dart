import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/thunder.png',
      height: 220,
      width: 260,
      fit: BoxFit.contain,
    );
  }
}
