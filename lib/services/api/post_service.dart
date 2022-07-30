import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/models/ApiExceptionModel.dart';
import 'package:shopybee/uitls/global_context.dart';

class PostService {
  Logger logger = Logger('PostService');
  Future<dynamic> post(
      {required String endUrl,
      required String jsondata,
      String? message,
      required bool showMessage}) async {
    try {
      logger.info("Post Body : $jsondata");
      final Response response = await http.post(Uri.parse(baseUrl + endUrl),
          body: jsondata, headers: {'Content-Type': "application/json"});
      logger.info('Post response :${response.body}');
      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          final apiException =
              apiExceptionModelFromMap(response.body.toString());
          logger.info(apiException.error);
          ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
              .showSnackBar(SnackBar(content: Text(apiException.error)));
          return null;
        case 401:
          // ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
          //     .showSnackBar(const SnackBar(content: Text('Unauthorised')));
          return null;
        case 404:
          final apiException =
              apiExceptionModelFromMap(response.body.toString());
          logger.info(apiException.error);
          ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
              .showSnackBar(SnackBar(content: Text(apiException.error)));
          return null;
        default:
          // ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
          //     .showSnackBar(const SnackBar(
          //         content: Text('Network connectivity problem')));
          return null;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}
