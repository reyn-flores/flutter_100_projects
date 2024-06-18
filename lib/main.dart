import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_100_projects/tasks.dart';

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
      home: const ReorderableExample(),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final todoTask = todoList[index];
              return Card(
                key: Key(todoTask.id),
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(
                    value: todoTask.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        todoList[index] = todoTask.toggleCompleted();
                      });
                    },
                  ),
                  title: Text(todoTask.task),
                  subtitle: Text(todoTask.category),
                  trailing: const Icon(Icons.drag_indicator),
                ),
              );
            },
            itemCount: todoList.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final TodoTask item = todoList.removeAt(oldIndex);
                todoList.insert(newIndex, item);
              });
            },
            proxyDecorator: _proxyDecorator,
          ),
        ),
      ),
    );
  }

  Widget _proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    final todoTask = todoList[index];
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(1, 4, animValue)!;
        final double scale = lerpDouble(1, 1.02, animValue)!;
        return Transform.scale(
          scale: scale,
          child: Card(
            color: Colors.white,
            elevation: elevation,
            child: ListTile(
              leading: Checkbox(
                value: todoTask.isCompleted,
                onChanged: (value) {
                  // Do nothing
                },
              ),
              title: Text(todoTask.task),
              subtitle: Text(todoTask.category),
              trailing: const Icon(Icons.drag_indicator),
            ),
          ),
        );
      },
      child: child,
    );
  }
}
