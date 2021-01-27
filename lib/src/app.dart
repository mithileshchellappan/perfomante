import 'package:flutter/material.dart';
import 'package:perfomante/src/screens/newsList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Perfomante',
      home: NewsList(),
    );
  }
}