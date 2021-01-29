import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title:Container(color:Colors.grey.shade200,child:Text('           ')),
        subtitle: Container(color:Colors.grey.shade200,child:Text(' '),width: 5,),
      ),
      Divider(height: 10),
    ]);
  }
}
