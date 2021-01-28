import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/stories_bloc.dart';
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
          print('no data');
          return Center(child: CircularProgressIndicator());
        }
        
        else {
          print(snapshot.data.length.toString());
          print('has data');
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              print('index ${snapshot.data[index]}');
              bloc.fetchItem(snapshot.data[index]); 
              return NewsListTile(itemId:snapshot.data[index]);
            },
          );
        }
      },
    );
  }
}
