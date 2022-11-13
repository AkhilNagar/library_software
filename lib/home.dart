import 'package:flutter/material.dart';
import 'package:library_software/mybooks.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("OpenLibrary")),
      body: Container(
        child: RaisedButton(
            child: Text('Go to my books'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyBooks()));
            }
        ),
      ),
    );
  }

}
