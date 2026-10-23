import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionService {
  Future<bool> get hasInternetAccess async {
    return InternetConnection().hasInternetAccess;
  }
}