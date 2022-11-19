import 'package:flutter/material.dart';
import 'mybooks.dart';
import 'profile.dart';
// import 'package:equatable/equatable.dart';

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
      body:
      // Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("images/background.jpg"),
      //         fit: BoxFit.cover
      //     ),
      //   ),
        Column(
          children: [
            SectionTitle(title: 'Trending Books'),


          ]
        ),
        // child:FloatingActionButton(
        //     // largeSizeConstraints: BoxConstraints.tightFor(width:120, height:80),
        //     child: Text('Go to my books'),
        //     onPressed: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => MyBooks()));
        //     }
        // ),
      );
    // );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }): super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style:Theme.of(context).textTheme.headline5,
            ),
        ),
    );
  }
}

// abstract class Book extends Equatable {
//
// }


