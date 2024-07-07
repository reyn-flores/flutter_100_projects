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
      home: Scaffold(
        body: ButtonColor(
          color: Colors.red,
          child: ButtonText(
            text: const Text('Inherited text'),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Inherit the ButtonColor
                  Builder(builder: (BuildContext innerContext) {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ButtonColor.of(innerContext).color,
                      ),
                      child: const Text('Color'),
                    );
                  }),

                  const SizedBox(height: 24),
                  // Inherit the ButtonText
                  Builder(builder: (BuildContext innerContext) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: ButtonText.of(innerContext).text,
                    );
                  }),

                  const SizedBox(height: 24),
                  // Inherit both the ButtonColor and ButtonText
                  const InheritedButton(),

                  const SizedBox(height: 24),
                  // Demo on nesting inherited widgets
                  // Will get the closest in the widget tree
                  const ButtonText(
                    text: Text('Hello there!'),
                    child: InheritedButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonColor extends InheritedWidget {
  const ButtonColor({
    super.key,
    required this.color,
    required super.child,
  });

  final Color color;

  static ButtonColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonColor>();
  }

  static ButtonColor of(BuildContext context) {
    final ButtonColor? result = maybeOf(context);
    assert(result != null, 'No ButtonColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ButtonColor oldWidget) => color != oldWidget.color;
}

class ButtonText extends InheritedWidget {
  const ButtonText({
    super.key,
    required this.text,
    required super.child,
  });

  final Text text;

  static ButtonText? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonText>();
  }

  static ButtonText of(BuildContext context) {
    final ButtonText? result = maybeOf(context);
    assert(result != null, 'No ButtonText found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ButtonText oldWidget) => text != oldWidget.text;
}

class InheritedButton extends StatelessWidget {
  const InheritedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ButtonColor.of(context).color,
      ),
      child: ButtonText.of(context).text,
    );
  }
}
