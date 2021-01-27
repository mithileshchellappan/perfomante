import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
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
        } else {
          print('has data');
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return Text(snapshot.data[index].toString());
            },
          );
        }
      },
    );
  }
}
