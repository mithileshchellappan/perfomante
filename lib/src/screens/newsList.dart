import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/stories_bloc.dart';
import 'package:perfomante/src/widgets/refresh.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    //print('at bloc'+bloc.fetchTopIds().toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Refresh(
              child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              print('index ${snapshot.data[index]}');
              bloc.fetchItem(snapshot.data[index]);
              return NewsListTile(itemId: snapshot.data[index]);
            },
          ));
        }
      },
    );
  }
}
