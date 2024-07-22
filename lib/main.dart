import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100_projects/app.dart';
import 'package:flutter_100_projects/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
