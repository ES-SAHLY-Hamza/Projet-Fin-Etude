import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Title" , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22
        )) , backgroundColor: Colors.blue),
        body: Container(
          child: Image.asset("")

        )
      ));
  }
}
