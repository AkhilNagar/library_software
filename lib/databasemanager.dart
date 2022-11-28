import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference donatedList = FirebaseFirestore.instance.collection('donatedBooks');
class Database {
  static String? title;
  static String? description;
  static String? author;
  static String? bookimage;
  static String? authorimage;
  static int? score;

}
class DatabaseManager {
  static String? title;
  static Future<void> addItem({
    required String title,
    required String description,
    required String author,
    required String authorimage,
    required String bookimage,
    required int score,

  }) async {
    DocumentReference documentReferencer =
    donatedList.doc(title);
    //.doc(title).collection('donatedBooks').

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "author":author,
      "authorimage":authorimage,
      "bookimage":bookimage,
      "score":score,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }



  static CollectionReference _collectionRef = FirebaseFirestore.instance.collection('donatedBooks');

   static Future<List<Object?>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
  }
}


  // final CollectionReference donatedList = FirebaseFirestore.instance.collection('donatedBooks');
  //
  // Future<void> newDonate(String name, String bookName, String email, int number) async {
  //
  // }


