import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perfomante/src/widgets/loading_container.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> map;
  final int depth;

  const Comment({Key key, this.itemId, this.map, this.depth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: map[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        final children = <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: depth * 15.0),
            title: buildText(snapshot.data),
            subtitle: snapshot.data.by == ''
                ? Text('Deleted Comment')
                : Text(snapshot.data.by),
          ),
          Divider(),
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(itemId: kidId, map: map, depth: depth + 1),
          );
        });

        return Column(children: children);
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
      .replaceAll('&#x27;', "'")
      .replaceAll('<p>', "\n\n")
      .replaceAll('</p>', "")
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&#x2f;&#x2f;', '//');
    return Text(text);
      
  }
}
