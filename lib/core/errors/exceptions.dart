class ServerException implements Exception {
  final String message;

  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);
}

class FirestoreException implements Exception {
  final String message;

  const FirestoreException(this.message);
}

class NoInternetException implements Exception {
  const NoInternetException();
}