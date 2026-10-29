import 'package:flutter/material.dart';

class WeatherLoadingAnimation extends StatefulWidget {
  const WeatherLoadingAnimation({super.key});

  @override
  State<WeatherLoadingAnimation> createState() =>
      _WeatherLoadingAnimationState();
}

class _WeatherLoadingAnimationState extends State<WeatherLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _float = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _float.value),
                child: Image.asset(
                  'assets/thunder.png',
                  height: 180,
                  width: 220,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          const SizedBox(height: 30),

          const Text(
            'Fetching Weather...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: 120,
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
