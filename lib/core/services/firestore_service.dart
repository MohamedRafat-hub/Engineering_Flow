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
    if(uid !=null) {
      await _firebaseFireStore.collection(path).doc(uid).set(data);
    }
    else {
      await _firebaseFireStore.collection(path).add(data);
    }
  }
}
