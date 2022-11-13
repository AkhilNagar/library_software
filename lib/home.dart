import 'package:flutter/material.dart';
import 'mybooks.dart';
import 'profile.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Homepage() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

class Homepage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child:FloatingActionButton(
            child: Text('Go to my books'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyBooks()));
            }
        ),
      ),
    );
  }
}

