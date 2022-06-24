import 'package:pp/models/app_state.dart';
//import 'package:pp/redux/reducers/platform_exception_reducer.dart';
//import 'package:pp/redux/reducers/reducers.dart';
import 'package:flutter/foundation.dart';

AppState appReducer(AppState state, action){

  if (kDebugMode) {
    print("reducer");
    //print(state.currentUser);
  }
  return const AppState(
    //currentUser: userAppReducer(state.currentUser, action),
    //messages: messagesReducer(state.messages, action),
    //message: messageReducer(state.messages, action),
    //platformException: platformExceptionReducer(state.platformException, action),
  );
}