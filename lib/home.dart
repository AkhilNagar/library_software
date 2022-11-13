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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover
          ),
        ),
        child:FloatingActionButton(
            // largeSizeConstraints: BoxConstraints.tightFor(width:120, height:80),
            child: Text('Go to my books'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyBooks()));
            }
        ),
      ),
    );
  }
}

