import 'dart:async';
import 'dart:convert';
import 'package:pp/models/user_app.dart';
import 'package:pp/abstract/app_repository_abs.dart';
import 'package:pp/helpers/api_helpers.dart';
import 'package:pp/helpers/http_client.dart';
import 'package:pp/settings/settings.dart';
import 'package:pp/models/message.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class AppRepository implements AppRepositoryAbs{
  
  @override
  Future<List<Message>> getMessages(UserApp? currentUser) async {
    http.Response response = 
      await ApiHttpClient(http.Client(), token: currentUser?.token)
      .get(Uri.parse("${AppContants.endPoint}/user/messages?rows=50&page="));

    if (kDebugMode) {
      print("app_repository");
      print(jsonDecode(response.body));
    }
    checkResponseSuccess(response);
    final Map res = jsonDecode(response.body);
    return (res['messages'] as List).map((d) => Message.fromJson(d)).toList();
  }

   @override
  Future<Message> fetchMessageDetail(UserApp? currentUser, String messageId) async {
    http.Response response =
        await ApiHttpClient(http.Client(), token: currentUser?.token)
            .get(Uri.parse("${AppContants.endPoint}/user/messages/$messageId"));
    checkResponseSuccess(response);
    final res = jsonDecode(response.body);

    if (kDebugMode) {
        print("_fetchMessageDetail");
        print(jsonEncode(res));
    }
    
    final Message mess = Message.fromJson(res);
    
    return mess;
  }

}