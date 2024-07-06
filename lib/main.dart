import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Click on the icon button or the elevated button'),
              const SizedBox(
                height: 24,
              ),
              IconButton(
                onPressed: () {
                  _toggleThemeMode();
                },
                icon: Icon(
                  _isLightMode() ? Icons.dark_mode : Icons.light_mode,
                  size: 36,
                ),
              ),
              Text('You are in ${_isLightMode() ? 'light' : 'dark'} mode'),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  _toggleThemeMode();
                },
                child: Text('Enter ${_isLightMode() ? 'dark' : 'light'} mode'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isLightMode() {
    return _themeMode != ThemeMode.dark;
  }

  void _toggleThemeMode() {
    setState(() {
      if (_isLightMode()) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }
}
