import 'package:pp/redux/actions/actions.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';

final platformExceptionReducer = combineReducers<PlatformException?>([
  // Auth
  TypedReducer<PlatformException?, LogInFailResponseAction>(_setException),
  TypedReducer<PlatformException?, LogInSuccessfulResponseAction>(_removeException)
]);

PlatformException _setException(PlatformException? state, action) => action.error;

PlatformException? _removeException(PlatformException? state, action) => null;