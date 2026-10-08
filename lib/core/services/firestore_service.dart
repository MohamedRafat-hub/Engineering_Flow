import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_flow/core/services/database_service.dart';

class FireStoreService extends DatabaseService {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uid,
  }) async {
    if (uid != null) {
      await _firebaseFireStore.collection(path).doc(uid).set(data);
    } else {
      await _firebaseFireStore.collection(path).add(data);
    }
  }

  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? uid,
  }) async {
    if (uid != null) {
      final snapshot =
      await _firebaseFireStore.collection(path).doc(uid).get();

      if (!snapshot.exists) {
        return [];
      }

      return [
        snapshot.data() as Map<String, dynamic>,
      ];
    }

    final snapshot = await _firebaseFireStore.collection(path).get();

    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
