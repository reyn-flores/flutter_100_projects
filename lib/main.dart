import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PokemonCard(),
      ),
    );
  }
}

class PokemonCard extends StatefulWidget {
  const PokemonCard({super.key});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _backgroundAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 350,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFC210D),
                  Color(0xffF7CE38),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
            child: AnimatedBuilder(
              animation: _backgroundAnimationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _backgroundAnimationController.value * 2 * pi,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/pokeball.png',
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: -8,
            top: -8,
            right: -8,
            bottom: -24,
            child: Image.asset(
              'assets/dragonite.png',
            ),
          ),
          Positioned(
            top: 16,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dragonite',
                  style: GoogleFonts.archivo(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Type(type: 'dragon', color: Colors.purple.shade400),
                    const SizedBox(width: 4),
                    Type(type: 'flying', color: Colors.blue.shade400),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 24,
            child: Text(
              '#0149',
              style: GoogleFonts.archivoBlack(
                fontSize: 48,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Type extends StatelessWidget {
  const Type({
    super.key,
    required this.type,
    required this.color,
  });

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: Text(
          type,
          style: GoogleFonts.archivo(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
