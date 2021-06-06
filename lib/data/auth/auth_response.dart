class AuthResponse {
  AuthResponse({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  AuthResult result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    result: AuthResult.fromJson(json["result"]),
    targetUrl: json["targetUrl"],
    success: json["success"],
    error: json["error"],
    unAuthorizedRequest: json["unAuthorizedRequest"],
    abp: json["__abp"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "targetUrl": targetUrl,
    "success": success,
    "error": error,
    "unAuthorizedRequest": unAuthorizedRequest,
    "__abp": abp,
  };
}

class AuthResult {
  AuthResult({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
  });

  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  factory AuthResult.fromJson(Map<String, dynamic> json) => AuthResult(
    accessToken: json["accessToken"],
    encryptedAccessToken: json["encryptedAccessToken"],
    expireInSeconds: json["expireInSeconds"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "encryptedAccessToken": encryptedAccessToken,
    "expireInSeconds": expireInSeconds,
    "userId": userId,
  };
}
