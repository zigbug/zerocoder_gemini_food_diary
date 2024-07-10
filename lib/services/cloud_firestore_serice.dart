import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Чтение данных из коллекции
  Stream<QuerySnapshot<Map<String, dynamic>>> readCollection(
      String collectionPath) {
    return _firestore.collection(collectionPath).snapshots();
  }

  // Чтение документа по ID
  Future<DocumentSnapshot<Map<String, dynamic>>> readDocument(
      String collectionPath, String documentId) {
    return _firestore.collection(collectionPath).doc(documentId).get();
  }

  // Запись данных в документ
  Future<void> writeDocument(
      String collectionPath, String documentId, Map<String, dynamic> data) {
    return _firestore.collection(collectionPath).doc(documentId).set(data);
  }

  // Обновление данных в документе
  Future<void> updateDocument(
      String collectionPath, String documentId, Map<String, dynamic> data) {
    return _firestore.collection(collectionPath).doc(documentId).update(data);
  }

  // Удаление документа
  Future<void> deleteDocument(String collectionPath, String documentId) {
    return _firestore.collection(collectionPath).doc(documentId).delete();
  }
}
