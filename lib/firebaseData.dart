import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Book {

  String title;
  String description;
  // Author author;
  // String score;
  // String image;

  // Book(this.title, this.description, this.author, this.score, this.image);
  Book(this.title, this.description);

}

static Book fromJson(Map<String, dynamic> json) => Book { (
title : json['title'],
description = json['description'],
);
 cd  
}

Stream<List<Book>> readBooks() => FirebaseFirestore.instance
    .collection('books')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Book.fromJsondoc.data()).toList());
