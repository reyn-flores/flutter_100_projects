import 'package:flutter/material.dart';
import 'package:flutter_100_projects/neu_button.dart';
import 'package:flutter_100_projects/neu_button_circular.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSquareButtonPressed = false;
  bool isCircleButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuButton(
              onTap: () {
                setState(() {
                  isSquareButtonPressed = !isSquareButtonPressed;
                });
              },
              isButtonPressed: isSquareButtonPressed,
            ),
            const SizedBox(
              height: 48,
            ),
            NeuButtonCircular(
              onTap: () {
                setState(() {
                  isCircleButtonPressed = !isCircleButtonPressed;
                });
              },
              isButtonPressed: isCircleButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
