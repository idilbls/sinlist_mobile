import 'package:sinlist_mobile/core/security/base_auth.dart';

class User extends BaseUser {
  User(this.email, this.id);
  final String email;
  final int id;
}
