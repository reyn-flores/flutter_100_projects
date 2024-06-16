import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown timer with Tween',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountdownTimer(),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  bool isPaused = true;
  Duration duration = const Duration(seconds: 60);
  late Duration runningDuration = duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '1 minute countdown timer',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            if (isPaused) ...[
              _buildTimer(runningDuration),
            ] else ...[
              TweenAnimationBuilder(
                tween: Tween(
                  begin: runningDuration,
                  end: const Duration(milliseconds: 0),
                ),
                duration: runningDuration,
                builder: (context, value, child) {
                  runningDuration = value;
                  return _buildTimer(value);
                },
                onEnd: () {
                  setState(() {
                    isPaused = true;
                    duration = const Duration(seconds: 60);
                    runningDuration = duration;
                  });
                },
              ),
            ],
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPaused = !isPaused;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(30),
                backgroundColor: isPaused
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text(
                isPaused ? 'Start' : 'Pause',
                style: TextStyle(
                  fontSize: 16.0,
                  color: isPaused
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimer(Duration value) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 275,
          width: 275,
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            strokeCap: StrokeCap.round,
            strokeWidth: 12.0,
            value: value.inMilliseconds / duration.inMilliseconds,
          ),
        ),
        Text(
          _formatDuration(value),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        )
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
