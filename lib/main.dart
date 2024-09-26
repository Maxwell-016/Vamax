import 'package:flutter/material.dart';
import 'package:vamax/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamax',
      onGenerateRoute: (route) => Routes.routeMaker(route),
      initialRoute: '/home',

    );
  }
}
