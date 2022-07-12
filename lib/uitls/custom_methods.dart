import 'dart:convert';

Map<String, dynamic> getResponseBody(dynamic response) {
  return json.decode(response.body) as Map<String, dynamic>;
}
