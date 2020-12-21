
import 'package:flutter/material.dart';
import './calcola_costi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcola costi viagio',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CalcolaCostiScreen(),
    );
  }
}

