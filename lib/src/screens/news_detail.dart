import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final itemId;

  const NewsDetail({Key key, this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Text('$itemId page'),
    );
  }
}
