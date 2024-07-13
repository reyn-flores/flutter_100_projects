import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BounceAnimationDemo(),
    );
  }
}

class BounceAnimationDemo extends StatefulWidget {
  const BounceAnimationDemo({super.key});

  @override
  State<BounceAnimationDemo> createState() => _BounceAnimationDemoState();
}

class _BounceAnimationDemoState extends State<BounceAnimationDemo> {
  bool isAnimationPlaying = false;
  double height = 100;
  double width = 100;

  void _startBounceAnimation({double? height, double? width}) {
    setState(() {
      this.height = height ?? this.height;
      this.width = width ?? this.width;
    });

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        setState(() {
          this.height = 100;
          this.width = 100;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Tap the box!'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _startBounceAnimation(height: 200),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                height: height,
                width: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _startBounceAnimation(width: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                height: 100,
                width: width,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _startBounceAnimation(height: 200, width: 200),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                height: height,
                width: width,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
