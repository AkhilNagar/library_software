import 'package:flutter/material.dart';
import 'profile.dart';


class MyBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('My Books')),
      body: Container(
        child:
          FloatingActionButton(
              child: Text('Go to my profile'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
              }
          ),
    ),

    );
  }
}