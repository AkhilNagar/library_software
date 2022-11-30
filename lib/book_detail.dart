import 'dart:convert';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mybooks.dart';
import 'main.dart';

// final Book book=[{"title":""}];

class BookDetail extends StatelessWidget {

  final Book book;
  var decoded_image;

  BookDetail({required this.book});
  @override
  Widget build(BuildContext context) {
    print("Decode start");
    decoded_image= base64Decode(book.bookimage);
    print("Decode complete");

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          Container(
            child: Container(
              width: 500,
              height: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit:BoxFit.cover,
                    image: Image.memory(decoded_image).image
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48, left: 32,),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 32, left: 32, bottom: 16,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                            book.title,
                            style: GoogleFonts.catamaran(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),

                          Text(
                            book.author,
                            style: GoogleFonts.catamaran(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [

                                Row(
                                  children: <Widget>[

                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star_half, size: 20, color: kStarsColor,),

                                  ],
                                ),

                                SizedBox(
                                  width: 12,
                                ),

                                Text(
                                  book.score.toString(),
                                  style: GoogleFonts.catamaran(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                book.description,
                                style: GoogleFonts.catamaran(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 100,
                    width: size.width,
                    padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 32,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Container(
                          width: size.width / 2 - 44,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: ButtonStyle (

                                  ),
                                  child: Text("Checkout"),
                                  onPressed:() {

                                      FOOD_DATA.add(
                                        {
                                          "Name":book.title,
                                          "Author":book.author,
                                          "Rating":book.score.toString(),
                                          "image": book.bookimage
                                        }
                                      );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'OpenLibrary',)),
                                      );

                                  },
                                  // text: "Checkout",
                                  // onPressed: (){
                                  // s
                                  ),

                                // ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              // ),
                              ],
                            ),
                          ),
                        ),
                        // ),


                        Container(
                          width: size.width / 2 - 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get a copy",
                                  style: GoogleFonts.catamaran(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.content_copy,
                                  color: kPrimaryColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}

