import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'databasemanager.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


String name="",author="";
int score=0;
String description="";
String bookimage="";
String bookfin="";
String authorimage="";
String authorfin="";
class DonateBooks extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<DonateBooks> {


  bool _obscureText = true;

  String groupValue="male";
  final _formkey=GlobalKey<FormState>();

  // valueChanged(e){
  //   setState(() {
  //     if(e=="male"){
  //       groupValue=e;
  //       gender=e;
  //     }
  //     else if(e=="female"){
  //       groupValue=e;
  //       gender=e;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    print("Textt");


    return Scaffold(
        appBar: AppBar(title: Text("Donate Book!"),backgroundColor: Color(0xff967259),),
        body: Stack(
          children:<Widget>[
            Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      onChanged: (value) => name = value,
                      decoration: InputDecoration(
                        labelText: "Book Name",
                        icon: Icon(Icons.book),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) => author = value,
                      decoration: InputDecoration(
                        labelText: "Author",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => description = value,
                      decoration: InputDecoration(
                        labelText: "Description",
                        icon: Icon(Icons.description),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => score = int.parse(value),
                      decoration: InputDecoration(
                        labelText: "Book rating",
                        icon: Icon(Icons.grade),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) => bookimage = value,
                      decoration: InputDecoration(
                        labelText: "URL of Book Image",
                        icon: Icon(Icons.book),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) => authorimage = value,
                      decoration: InputDecoration(
                        labelText: "URL of Author Image",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Button(
                    text: 'Donate',
                    //callback: null,
                    key: null,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
class Button extends StatelessWidget {
  //final VoidCallback callback;
  final String text;
  Future<String?> networkImageToBase64(String mediaUrlString) async {
    //var image = await ImageDownloader.downloadImage(mediaUrlString);
    final http.Response responseData = await http.get(Uri.parse(mediaUrlString));
    var uint8list = responseData.bodyBytes;
    // File file = await toFile(uriString);
    // final bytes = file.readAsBytesSync();
    // var response = await http.get(Uri.parse(mediaUrlString));
    // final bytes = response?.bodyBytes;
    return (uint8list != null ? base64Encode(uint8list) : null);
    // var path = await ImageDownloader.findPath(image);
    // return base64Encode(path);
  }

  Future<void> encode(String s, String book) async {
    var a;
    var b;
    print("Start Encode");
    a = await
    networkImageToBase64(s);
    //b = await networkImageToBase64(book);
    b="a";
    print("aaa");
    print(a);
    print("Encode Complete");
    // print(a);
    authorfin=a;
    bookfin = b;
  }


  @override
  Future<void> enc(String s, String book) async {
     encode(authorimage, bookimage);

  }

  //required this.callback,
  Button({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.brown,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          //onPressed: callback,
          minWidth: 200.0,
          height: 45.0,

          onPressed: () async {
            enc(authorimage, bookimage);
            await Future.delayed(const Duration(seconds: 5));
            DatabaseManager.addItem(title: name,
                  description: description,
                  author: author,
                  authorimage: authorfin,
                  bookimage:bookfin,
                  score: score);

            // FirebaseFirestore.instance
            //     .collection('donatedBooks')
            //     .add({"title": "title",
            //   "description": "description",
            //   "author":"author",
            //   "image":"image",
            //   "score":5});
          },    //ADD BUTTON FUNCTION HERE

          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}