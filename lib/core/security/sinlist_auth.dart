import 'package:flutter/material.dart';
import 'package:sinlist_mobile/bloc/auth/auth_repository.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/core/http/response.dart';
import 'package:sinlist_mobile/core/security/base_auth.dart';
import 'package:sinlist_mobile/core/security/secure_storage.dart';
import 'package:sinlist_mobile/core/utilities/constants.dart';
import 'package:sinlist_mobile/data/auth/auth_request.dart';
import 'package:sinlist_mobile/data/auth/auth_response.dart';
import 'package:sinlist_mobile/data/auth/user.dart';

class PartialXAuth extends BaseAuth {
  PartialXAuth({@required this.authRepository});
  BaseUser currentUserValue;

  final AuthRepository authRepository;

  @override
  Future<bool> changePassword(String emailOrUserName, String oldPassword, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<String> createUser(String emailOrUserName, String password) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<BaseUser> currentUser() async {
    return currentUserValue;
  }

  @override
  Future<Response> signIn(String emailOrUserName, String password) async {
    Response response;
    var result =
    await authRepository.login(new AuthRequest(userNameOrEmailAddress: emailOrUserName, password: password, rememberClient: true));
    result.when(success: (AuthResult authResult) {
      SecureStorage.instance.write(Constants.AUTH_TOKEN, authResult.accessToken);
      SecureStorage.instance.write(Constants.CURRENT_USER, authResult.userId.toString());
      currentUserValue = new User(emailOrUserName, authResult.userId);
      response = new Response(success: true, result: currentUserValue);
    }, failure: (NetworkExceptions exceptions) {
      currentUserValue = null;
      response =
      new Response(success: false, error: new ResponseError(code: 0, message: NetworkExceptions.getErrorMessage(exceptions)));
    });
    return response;
  }

  @override
  Future<void> signOut() {
    SecureStorage.instance.delete(Constants.AUTH_TOKEN);
    SecureStorage.instance.delete(Constants.CURRENT_USER);
    currentUserValue = null;
    return Future.value();
  }
}
