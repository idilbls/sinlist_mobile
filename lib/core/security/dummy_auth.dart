import 'package:sinlist_mobile/core/http/response.dart';
import 'package:sinlist_mobile/core/security/base_auth.dart';

class DummyUser extends BaseUser {
  DummyUser(this.email, this.id);
  final String email;
  final int id;
}

class DummyAuth extends BaseAuth {
  DummyUser currentUserValue;
  @override
  Future<String> createUser(String email, String password) async {
    return "1";
  }

  @override
  Future<BaseUser> currentUser() async {
    return currentUserValue;
  }

  @override
  Future<Response> signIn(String email, String password) async {
    Response response;
    if (email.trim() == "oktay") {
      currentUserValue = new DummyUser(email.trim(), 1);
    } else if (email.trim() == "erdincsezer@yahoo.com" && password == "1111") {
      currentUserValue = new DummyUser(email.trim(), 1);
    } else if (email.trim() == "erdinc.sezer@omnitechsoftware.com" && password == "1234") {
      currentUserValue = new DummyUser(email.trim(), 2);
    } else
      return Response(success: false, error: new ResponseError(code: 0, message: "Kullanıcı bilgilerinizi hatalı girdiniz"));

    return new Response(success: true, result: currentUserValue);
  }

  @override
  Future<void> signOut() {
    currentUserValue = null;
    return Future.value();
  }

  @override
  Future<bool> changePassword(String email, String oldPassword, String newPassword) {
    return Future.value(true);
  }
}
