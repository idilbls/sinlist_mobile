// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  dynamic result;
  dynamic targetUrl;
  bool success;
  Error error;
  bool unAuthorizedRequest;
  bool abp;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    result: json["result"],
    targetUrl: json["targetUrl"],
    success: json["success"],
    error: json["error"] != null ? Error.fromJson(json["error"]) : null,
    unAuthorizedRequest: json["unAuthorizedRequest"],
    abp: json["__abp"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "targetUrl": targetUrl,
    "success": success,
    "error": error.toJson(),
    "unAuthorizedRequest": unAuthorizedRequest,
    "__abp": abp,
  };
}

class Error {
  Error({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  int code;
  String message;
  dynamic details;
  dynamic validationErrors;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"],
    message: json["message"],
    details: json["details"],
    validationErrors: json["validationErrors"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "details": details,
    "validationErrors": validationErrors,
  };
}
