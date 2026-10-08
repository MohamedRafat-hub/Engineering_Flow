abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uid,
  });

  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? uid,
  });// General method
}
