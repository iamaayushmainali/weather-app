import 'package:flutter/material.dart';

class BuildTopBar extends StatelessWidget {
  final String cityName;

  const BuildTopBar({required this.cityName, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: const Center(
            child: Icon(Icons.grid_view_rounded, color: Colors.white, size: 20),
          ),
        ),

        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(width: 4),
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.25),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircleAvatar(radius: 3, backgroundColor: Color(0xFFFFD600)),
                  SizedBox(width: 6),
                  Text(
                    'Updating',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.more_vert, color: Colors.white, size: 26),
          ),
        ),
      ],
    );
  }
}
