abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uid,
  });


  Stream<List<Map<String, dynamic>>> getData({
    required String path,
    String? uid,
  });
  // General method

  Future<void> updateData(String userId, Map<String, dynamic> data , String path);

  Future<Map<String, dynamic>?> getDocument({
    required String path,
    required String uid,
  });
}
