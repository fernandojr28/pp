import 'dart:async';
//import 'dart:convert';
import 'package:pp/models/user_app.dart';
import 'package:pp/abstract/user_repository_abs.dart';
//import 'package:pp/helpers/api_helpers.dart';
//import 'package:pp/helpers/http_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:http/http.dart' as http;
//import 'package:pp/settings/settings.dart';
import 'package:flutter/foundation.dart';
//import 'package:googleapis/gmail/v1.dart' as gmail;

final GoogleSignIn _googleSignIn = GoogleSignIn.standard(scopes: ['https://www.googleapis.com/auth/gmail.readonly']);


class UserRepository implements UserRepositoryAbs {

  /*
  @override
  Future<UserApp> fetchUserData(UserApp currentUser) async {

    
    http.Response response =
        await ApiHttpClient(http.Client(), token: currentUser.token)
            .get(Uri.parse("${AppContants.endPoint}/user/me"));
    checkResponseSuccess(response);

    Map<String, dynamic> json = jsonDecode(response.body);

    if (kDebugMode) {
      //print(json);
    }
    Map<String, dynamic> data = json; //['data'];
    
    var current = UserApp.fromJson(data);

    return current.copyWith(
      token: currentUser.token
    );
  }
  */

  @override
  Future<UserApp> signInWithGoogle() async {
    
    await _googleSignIn.signOut();
    final GoogleSignInAccount? user = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? auth = await user?.authentication;

    final Map<String, dynamic> response = <String, dynamic>{};
    response['token'] = auth?.accessToken;

    if (kDebugMode) {
      //print(auth?.accessToken);
    }
    return UserApp.fromJson(response);
  }
}

