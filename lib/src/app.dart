import 'package:flutter/material.dart';
import 'package:perfomante/src/blocs/stories_provider.dart';
import 'package:perfomante/src/screens/newsList.dart';
import 'package:perfomante/src/screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Perfomante',
        home: NewsList(),
        onGenerateRoute: routes,
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  if(settings.name == '/'){
    return MaterialPageRoute(
    builder: (context) {
      return NewsList();
    },
  );
  }
  else{
    return MaterialPageRoute(builder: (context){
      final itemId = int.parse(settings.name.replaceFirst('/', ''));

      
      return NewsDetail(itemId: itemId);
    });
  }
  
}
