import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TabItem {
  UniqueKey? id = UniqueKey();
  String stateMachine;
  String artboard;
  late SMIBool? status;

  TabItem({
    required this.stateMachine,
    required this.artboard,
    this.status,
  });

  static List<TabItem> tabItems = [
    TabItem(stateMachine: 'CHAT_Interactivity', artboard: 'CHAT'),
    TabItem(stateMachine: 'SEARCH_Interactivity', artboard: 'SEARCH'),
    TabItem(stateMachine: 'TIMER_Interactivity', artboard: 'TIMER'),
    TabItem(stateMachine: 'BELL_Interactivity', artboard: 'BELL'),
    TabItem(stateMachine: 'USER_Interactivity', artboard: 'USER'),
  ];
}
