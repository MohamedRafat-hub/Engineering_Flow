
import 'package:engineering_flow/core/constants/firestore_constants.dart';
import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:engineering_flow/core/services/database_service.dart';
import '../../../../core/errors/exceptions.dart';

abstract class UsersRemoteDataSource {
  Future<String> createUser({
    required String email,
    required String password,
  });

  Future<void> addUser({
    required Map<String, dynamic> userData,
    required String uid,
  });

  Future<void> deleteUser({required String id});

  Stream<List<Map<String, dynamic>>> getAllUsers({
    String? uid,
  });

  Future<Map<String, dynamic>?> getCurrentUser();

  Future<void> changeUserActiveStatus(
      String userId,
      bool isActive,
      Map<String, dynamic> data,
      );
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final DatabaseService _databaseService;
  final FirebaseAuthService _firebaseAuthService;

  UsersRemoteDataSourceImpl(
      this._databaseService,
      this._firebaseAuthService,
      );

  @override
  Future<String> createUser({
    required String email,
    required String password,
  }) {
    return _firebaseAuthService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> addUser({
    required Map<String, dynamic> userData,
    required String uid,
  }) {
    return _databaseService.addData(
      path: FirestoreConstants.usersCollection,
      data: userData,
      uid: uid,
    );
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUser() async {
    final uid = _firebaseAuthService.getCurrentUserId();

    if (uid == null) {
      throw const AuthException('No authenticated user found');
    }

    return _databaseService.getDocument(
      path: FirestoreConstants.usersCollection,
      uid: uid,
    );
  }

  @override
  Stream<List<Map<String, dynamic>>> getAllUsers({
    String? uid,
  }) {
    return _databaseService.getData(
      path: FirestoreConstants.usersCollection,
      uid: uid,
    );
  }

  @override
  Future<void> changeUserActiveStatus(
      String userId,
      bool isActive,
      Map<String, dynamic> data,
      ) {
    return _databaseService.updateData(
      userId,
      data,
      FirestoreConstants.usersCollection,
    );
  }

  @override
  Future<void> deleteUser({required String id}) {
    throw UnimplementedError('deleteUser has not been implemented yet');
  }
}
