import 'package:flutter/material.dart';
import 'package:perfomante/src/widgets/loading_container.dart';
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
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }

            return buildTile(context,itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context,ItemModel item) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, '/${item.id}');
          },
          title: Text(item.title),
          subtitle: Text(item.score.toString() + ' votes by ${item.by} '),
          trailing: Column(
            children: [Icon(Icons.comment), Text(item.descendants.toString())],
          ),
          
        ),Divider(thickness: 3,height: 10.0,),
      ],
    );
  }
}
