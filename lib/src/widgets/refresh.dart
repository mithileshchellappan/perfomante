import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Widget child;
  Refresh({this.child});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: child, onRefresh: (){
      
    });
  }
}