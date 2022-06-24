
//import 'package:pp/models/models.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/foundation.dart';

//typedef void ErrorCallback(dynamic error);

typedef ErrorCallback = void Function(dynamic error);

class LogInFailResponseAction {
  LogInFailResponseAction(this.error);
  final PlatformException error;
}


class LogInSuccessfulResponseAction {
  //final UserApp user;
  //final VoidCallback? onCompeleted;
  //final ErrorCallback? onError;

  //LogInSuccessfulResponseAction(this.user, {this.onError, this.onCompeleted});
}

class SignInWithGoogleAndPasswordRequestAction {}

class LoadUserDataSuccessResponseAction {
  //final UserApp user;

  //LoadUserDataSuccessResponseAction(this.user);
}


class LogInRequiredAction {}