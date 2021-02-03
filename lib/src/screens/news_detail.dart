import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/comments_provider.dart';
import 'package:perfomante/src/models/item_model.dart';
import 'package:perfomante/src/widgets/loading_container.dart';

class NewsDetail extends StatelessWidget {
  final itemId;

  const NewsDetail({Key key, this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        final itemFuture = snapshot.data[itemId];
        return FutureBuilder(
            future: itemFuture,
            builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
              if (!itemSnapshot.hasData) {
                return LoadingContainer();
              }
              return buildList(itemSnapshot.data,snapshot.data);
            });
      },
    );
  }

  Widget buildList(ItemModel item,Map<int,Future<ItemModel>> itemMap){}

  Widget buildTitle(ItemModel item) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(8.0),
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400, 
           
        ),
      ),
    );
  }
}
