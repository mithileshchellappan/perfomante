import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> map;

  const Comment({Key key, this.itemId, this.map}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: map[itemId],
      builder: (context,AsyncSnapshot<ItemModel> snapshot) {
        if(!snapshot.hasData){
          return Text('loading');

        }
        return Text(snapshot.data.text);
      },
    );
  }
}
