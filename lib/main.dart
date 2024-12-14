import 'package:flutter/material.dart';
import 'home.dart';

void main()=>runApp(const myApp());

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Unit Convertor',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
