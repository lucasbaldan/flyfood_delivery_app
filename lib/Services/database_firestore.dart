import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseFirestore {
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> collection(String path) {
    return db.collection(path);
  }

  DocumentReference<Map<String, dynamic>> doc(String path) {
    return db.doc(path);
  }
}
