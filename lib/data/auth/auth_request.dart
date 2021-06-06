class AuthRequest {
  AuthRequest({
    this.userNameOrEmailAddress,
    this.password,
    this.rememberClient,
  });

  String userNameOrEmailAddress;
  String password;
  bool rememberClient;

  factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
    userNameOrEmailAddress: json["userNameOrEmailAddress"],
    password: json["password"],
    rememberClient: json["rememberClient"],
  );

  Map<String, dynamic> toJson() => {
    "userNameOrEmailAddress": userNameOrEmailAddress,
    "password": password,
    "rememberClient": rememberClient,
  };
}
