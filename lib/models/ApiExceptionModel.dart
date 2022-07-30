//     final apiExceptionModel = apiExceptionModelFromMap(jsonString);

import 'dart:convert';

ApiExceptionModel apiExceptionModelFromMap(String str) =>
    ApiExceptionModel.fromMap(json.decode(str));

String apiExceptionModelToMap(ApiExceptionModel data) =>
    json.encode(data.toMap());

class ApiExceptionModel {
  ApiExceptionModel({
    required this.error,
    required this.timestamp,
    required this.httpStatus,
  });

  String error;
  DateTime timestamp;
  String httpStatus;

  factory ApiExceptionModel.fromMap(Map<String, dynamic> json) =>
      ApiExceptionModel(
        error: json["error"],
        timestamp: DateTime.parse(json["timestamp"]),
        httpStatus: json["httpStatus"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "timestamp": timestamp.toIso8601String(),
        "httpStatus": httpStatus,
      };
}
