import 'package:sinlist_mobile/core/http/response.dart';

abstract class BaseAuth {
  Future<BaseUser> currentUser();
  Future<Response> signIn(String emailOrUserName, String password);
  Future<String> createUser(String emailOrUserName, String password);
  Future<bool> changePassword(String emailOrUserName, String oldPassword, String newPassword);
  Future<void> signOut();
}

abstract class BaseUser {
  int id;
  String email;
}
