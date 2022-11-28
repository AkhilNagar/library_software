import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'databasemanager.dart';
import 'data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
        appBar: AppBar(title: Text("Donate Book!"),backgroundColor: Color(0xff885566),),
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

                  // Padding(padding: const EdgeInsets.only(top: 10)),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     keyboardType: TextInputType.emailAddress,
                  //     onChanged: (value) => mname = value,
                  //     decoration: InputDecoration(
                  //       labelText: "Enter Your Mother's Name...",
                  //       icon: Icon(Icons.person),
                  //     ),
                  //   ),
                  // ),


                  // Row(children: <Widget>[
                  //   Expanded(
                  //     child: ListTile(
                  //       title: Text(
                  //         "Male",
                  //         textAlign: TextAlign.start,
                  //       ),
                  //       trailing: Radio(
                  //           value: "male",
                  //           groupValue: groupValue,
                  //           onChanged: (e) => valueChanged(e)),
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: ListTile(
                  //       title: Text(
                  //         "Female",
                  //         textAlign: TextAlign.start,
                  //       ),
                  //       trailing: Radio(
                  //           value: "female",
                  //           groupValue: groupValue,
                  //           onChanged: (e) => valueChanged(e)),
                  //     ),
                  //   ),
                  // ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 10,
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




                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     autocorrect: false,
                  //     obscureText: _obscureText,
                  //     onChanged: (value) => password = value,
                  //     decoration: InputDecoration(
                  //       labelText: "Create Password...",
                  //       icon: Icon(Icons.lock),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(
                  //           // Based on passwordVisible state choose the icon
                  //           _obscureText ? Icons.visibility : Icons.visibility_off,
                  //           color: Theme.of(context).primaryColorLight,
                  //         ),
                  //         onPressed: () {
                  //           // Update the state i.e. toogle the state of passwordVisible variable
                  //           setState(() {
                  //             _obscureText = !_obscureText;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     autocorrect: false,
                  //     obscureText: _obscureText,
                  //     onChanged: (value) => password = value,
                  //     decoration: InputDecoration(
                  //       labelText: "Confirm Password...",
                  //       icon: Icon(Icons.lock),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(
                  //           // Based on passwordVisible state choose the icon
                  //           _obscureText ? Icons.visibility : Icons.visibility_off,
                  //           color: Theme.of(context).primaryColorLight,
                  //         ),
                  //         onPressed: () {
                  //           // Update the state i.e. toogle the state of passwordVisible variable
                  //           setState(() {
                  //             _obscureText = !_obscureText;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
    final response = await http.get(Uri.parse(mediaUrlString));
    final bytes = response?.bodyBytes;
    return (bytes != null ? base64Encode(bytes) : null);
  }
  late final a;
  late final b;
  Future<void> encode(String s, String book) async {
    print("Statrtrtr");
    a = await
    networkImageToBase64(s);
    b = await networkImageToBase64(book);
    print("aaaa");
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