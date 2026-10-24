
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_flow/core/services/database_service.dart';
import 'package:engineering_flow/core/services/internet_connection_service.dart';

import '../errors/exceptions.dart';

class FireStoreService extends DatabaseService {
  final FirebaseFirestore _firebaseFireStore;
  final InternetConnectionService _internetConnectionService;

  FireStoreService(
      this._internetConnectionService, {
        FirebaseFirestore? firebaseFirestore,
      }) : _firebaseFireStore =
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<void> _checkInternetConnection() async {
    final hasInternet =
    await _internetConnectionService.hasInternetAccess;

    if (!hasInternet) {
      throw NoInternetException();
    }
  }

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uid,
  }) async {
    await _checkInternetConnection();

    final collection = _firebaseFireStore.collection(path);

    if (uid != null) {
      await collection.doc(uid).set(data);
    } else {
      await collection.add(data);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getData({
    required String path,
    String? uid,
  }) {
    final collection = _firebaseFireStore.collection(path);

    if (uid != null) {
      return collection.doc(uid).snapshots().map((snapshot) {
        if (!snapshot.exists) {
          return <Map<String, dynamic>>[];
        }

        return [
          {
            ...snapshot.data()!,
            'id': snapshot.id,
          },
        ];
      });
    }

    return collection.snapshots().map(
          (snapshot) => snapshot.docs.map((document) {
        return {
          ...document.data(),
          'id': document.id,
        };
      }).toList(),
    );
  }

  @override
  Future<Map<String, dynamic>?> getDocument({
    required String path,
    required String uid,
  }) async {
    final document = await _firebaseFireStore
        .collection(path)
        .doc(uid)
        .get();

    if (!document.exists) {
      return null;
    }

    return {
      ...document.data()!,
      'id': document.id,
    };
  }

  @override
  Future<void> updateData(
      String userId,
      Map<String, dynamic> data,
      String path,
      ) async {
    await _checkInternetConnection();

    await _firebaseFireStore
        .collection(path)
        .doc(userId)
        .update(data);
  }
}
