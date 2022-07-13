import 'dart:convert';

Map<String, dynamic> getResponseBody(dynamic response) {
  if (json.decode(response.body) == null) {
    return {};
  } else {
    return json.decode(response.body) as Map<String, dynamic>;
  }
}
