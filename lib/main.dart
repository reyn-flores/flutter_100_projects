import 'dart:math';

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
      home: const FlipCardWidget(),
    );
  }
}

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  bool showFront = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              showFront = !showFront;
            });
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: __transitionBuilder,
            layoutBuilder: (widget, list) =>
                Stack(children: [widget!, ...list]),
            switchInCurve: Curves.easeInBack,
            switchOutCurve: Curves.easeInBack.flipped,
            child: showFront ? _buildFront() : _buildBack(),
          ),
        ),
      ),
    );
  }

  _buildFront() {
    return Card(
      key: const ValueKey('front'),
      color: Colors.black,
      child: SizedBox(
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://images.unsplash.com/photo-1618284554746-71a7b3e923c6?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0),
                    ],
                    center: Alignment.center,
                    radius: 0.6,
                  ),
                ),
              ),
              const Positioned(
                bottom: 16.0,
                child: Column(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        Text(
                          'Manila, PH',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildBack() {
    return Card(
      key: const ValueKey('back'),
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        height: 400.0,
        width: 300.0,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Languages: Dart, Go, Python',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(showFront) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder
            ? min(rotateAnimation.value, pi / 2)
            : rotateAnimation.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
