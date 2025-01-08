import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_dating/features/navigation/screens/scaffold_nav_bar.dart';

void main() {
  runZonedGuarded(() => runApp(const MainApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldNavBar(),
    );
  }
}
