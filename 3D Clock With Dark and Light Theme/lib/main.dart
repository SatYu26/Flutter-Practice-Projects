import 'package:flutter/material.dart';
import 'package:image_view_3d/screen/clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pinged",
      debugShowCheckedModeBanner: false,
      home: Clock(),
    );
  }
}
