import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference donatedList = FirebaseFirestore.instance.collection('donatedBooks');
class Database {
  static String? title;
  static String? description;
  static String? author;
  static String? image;
  static int? score;

}
class DatabaseManager {
  static String? title;
  static Future<void> addItem({
    required String title,
    required String description,
    required String author,
    required String image,
    required int score,

  }) async {
    DocumentReference documentReferencer =
    donatedList.doc(title).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "author":author,
      "image":image,
      "score":score,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }





  // final CollectionReference donatedList = FirebaseFirestore.instance.collection('donatedBooks');
  //
  // Future<void> newDonate(String name, String bookName, String email, int number) async {
  //
  // }


}