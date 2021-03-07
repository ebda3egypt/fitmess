import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Text("Home",style: TextStyle(fontSize: 50),),
        ),
      ),
    );
  }
}
