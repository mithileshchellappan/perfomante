import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return FutureBuilder(
            future: getFuture(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data + index.toString())
                  : Text(index.toString());
            });
      },
    );
  }

  getFuture() {
    return Future.delayed(Duration(seconds: 2), () => 'yep im visible');
  }
}
