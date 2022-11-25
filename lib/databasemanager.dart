import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference donatedList = FirebaseFirestore.instance.collection('donatedBooks');

  Future<void> newDonate(String name, String bookName, String email, int number) async {

  }


}