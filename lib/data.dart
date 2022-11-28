import 'package:flutter/material.dart';
import 'databasemanager.dart';





class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.book),
    NavigationItem(Icons.local_library),
    NavigationItem(Icons.person),
  ];
}

class Book {

  String title;
  String description;
  String author;
  String authorimage;
  String bookimage;
  int? score;

  Book(this.title, this.description, this.author, this.authorimage,this.bookimage, this.score);

}

Future<List<Book>> getBookList() async {
  print("Hiii");
  Future<List<Object?>> data1= DatabaseManager.getData();
  List data = await data1 ;
  List <Book> b=[];
  print(data.length);
  for (int i=0;i<data.length;i++) {
    print("dat[i]");
    print(data[i]);
     var obj = Book(
       data[i]['title'],
       data[i]['description'],
       data[i]['author'],
       data[i]['authorimage'],
       data[i]['bookimage'],
       data[i]['score']

  );
    b.add(obj);
  }
  print("HEyyyy");


  print(b);
  return b;


}

class Author {

  String author;
  String authorimage;
  Author(this.author, this.authorimage);

}

Future<List<Author>> getAuthorList() async {
  print("YOoo");
  Future<List<Object?>> data2= DatabaseManager.getData();
  List data3 = await data2 ;
  List <Author> b1=[];
  print(data3.length);
  for (int i=0;i<data3.length;i++) {
    print("Pleaseee");
    print(data3[i]);
    var obj1 = Author(
        data3[i]['author'],
        data3[i]['authorimage'],
    );
    b1.add(obj1);
  }
  return b1;
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("CLASSICS"),
    Filter("NEW"),
    Filter("UPCOMING"),
  ];
}