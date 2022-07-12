import 'dart:convert';

Map<String, dynamic> getResponseBody(dynamic response) {
  if (response != null) {
    return json.decode(response.body) as Map<String, dynamic>;
  }
  return {};
}
