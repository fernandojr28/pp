
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void checkResponseSuccess(http.Response response) {
  _hashError(response);
  if (response.statusCode == 200) return;

  var message = "";
  try {
    Map json = jsonDecode(response.body);
    message = json['message'];
  } catch (e) {
    message = response.body;
  }
  throw PlatformException(
      code: "${response.statusCode}",
      message: message,
      details: response.body);
}

void _hashError(http.Response response) {

}