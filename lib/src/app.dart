import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/stories_provider.dart';
import 'package:perfomante/src/screens/newsList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Perfomante',
        home: NewsList(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) {
              return NewsList();
            },
          );
        },
      ),
    );
  }
}
