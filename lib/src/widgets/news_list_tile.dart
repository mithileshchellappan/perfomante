import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import 'dart:async';

class NewsListTile extends StatelessWidget {
  final int itemId;
  

  NewsListTile({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
  
 return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        //print(snapshot.data.length.toString);
        if (!snapshot.hasData) {
          print(snapshot.data);
          return Text('Stream Loading');
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return  Text('Loading Item $itemId');
            }

            return  buildTile(itemSnapshot.data);
          },
        );
      },
    );
  }
  Widget buildTile(ItemModel item){
    return ListTile(
        title: Text(item.title),
        subtitle: Text(item.score.toString() + ' votes'),
        trailing: Column(children: [Icon(Icons.comment),Text(item.descendants.toString())],),

    );
  }
}

