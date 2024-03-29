import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CustomTextStyle.dart';
import 'CustomUtils.dart';
import 'constants.dart';

import 'profile.dart';

class MyBooks extends StatefulWidget{
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<MyBooks> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["Name"],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["Author"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["Rating"]}",
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                // Image.asset(
                //   "assets/images/${post["image"]}",
                //   height: double.infinity,
                // )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My Books"),backgroundColor: Color(0xff967259),),
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search, color: Colors.black),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.person, color: Colors.black),
        //       onPressed: () {},
        //     )
        //   ],
        // ),
        body: new Container(
          // decoration: new BoxDecoration(
          //   image: new DecorationImage(image: new AssetImage("images/background.jpg"), fit: BoxFit.cover,),
          // ),
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          //height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Text(
                  //   "Loyality Cards",
                  //   style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  // Text(
                  //   "My books",
                  //   style: GoogleFonts.catamaran(
                  //     fontWeight: FontWeight.w900,
                  //     fontSize: 40,
                  //     height: 1,
                  //   ),
                  //
                  // ),
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = 0;
        //MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      // child: Container(
      //   margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      //   child: FittedBox(
      //     fit: BoxFit.fill,
      //     alignment: Alignment.topCenter,
      //     child: Row(
      //       children: <Widget>[
      //         // Container(
      //         //   width: 150,
      //         //   margin: EdgeInsets.only(right: 20),
      //         //   height: categoryHeight,
      //         //   decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      //         //   child: Padding(
      //         //     padding: const EdgeInsets.all(12.0),
      //         //     child: Column(
      //         //       crossAxisAlignment: CrossAxisAlignment.start,
      //         //       children: <Widget>[
      //         //         Text(
      //         //           "Most\nFavorites",
      //         //           style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      //         //         ),
      //         //         SizedBox(
      //         //           height: 10,
      //         //         ),
      //         //         Text(
      //         //           "20 Items",
      //         //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         //         ),
      //         //       ],
      //         //     ),
      //         //   ),
      //         // ),
      //         // Container(
      //         //   width: 150,
      //         //   margin: EdgeInsets.only(right: 20),
      //         //   height: categoryHeight,
      //         //   decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      //         //   child: Container(
      //         //     child: Padding(
      //         //       padding: const EdgeInsets.all(12.0),
      //         //       child: Column(
      //         //         crossAxisAlignment: CrossAxisAlignment.start,
      //         //         children: <Widget>[
      //         //           Text(
      //         //             "Newest",
      //         //             style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      //         //           ),
      //         //           SizedBox(
      //         //             height: 10,
      //         //           ),
      //         //           Text(
      //         //             "20 Items",
      //         //             style: TextStyle(fontSize: 16, color: Colors.white),
      //         //           ),
      //         //         ],
      //         //       ),
      //         //     ),
      //         //   ),
      //         // ),
      //         // Container(
      //         //   width: 150,
      //         //   margin: EdgeInsets.only(right: 20),
      //         //   height: categoryHeight,
      //         //   decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      //         //   child: Padding(
      //         //     padding: const EdgeInsets.all(12.0),
      //         //     child: Column(
      //         //       crossAxisAlignment: CrossAxisAlignment.start,
      //         //       children: <Widget>[
      //         //         Text(
      //         //           "Super\nSaving",
      //         //           style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      //         //         ),
      //         //         SizedBox(
      //         //           height: 10,
      //         //         ),
      //         //         Text(
      //         //           "20 Items",
      //         //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         //         ),
      //         //       ],
      //         //     ),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
