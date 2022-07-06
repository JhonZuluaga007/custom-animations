import 'package:flutter/material.dart';
import 'package:custom_animations/src/pages/animations_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const HeadersPage(),
      home: const AnimationsPage(),
    );
  }
}
