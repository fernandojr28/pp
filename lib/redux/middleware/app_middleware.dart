import 'package:pp/abstract/app_repository_abs.dart';
import 'package:redux/redux.dart';
import 'package:pp/models/app_state.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:flutter/foundation.dart';

List<Middleware<AppState>> createAppMiddleware(
  AppRepositoryAbs appRepository
) {
  return [
    TypedMiddleware<AppState, LogInSuccessfulResponseAction>(
      _fetchMessages(appRepository)),
    TypedMiddleware<AppState, LoadMessageRequestAction>(
        _fetchMessageDetail(appRepository)),
  ];
}

void Function(
  Store<AppState> store,
  LogInSuccessfulResponseAction action,
  NextDispatcher next
) _fetchMessages(AppRepositoryAbs appRepository) {
  return (store, action, NextDispatcher next) async {
    if (kDebugMode) {
      print("_fetchMessages");
      //print(jsonEncode(store.state.currentUser));
    }
    next(action);
    appRepository.getMessages(store.state.currentUser).then((data) => {
      store.dispatch(FetchMessageResponse(data))
    }).catchError((onError) {
      if (kDebugMode) {
      print("onError");
      print(onError);
      //print(jsonEncode(store.state.currentUser));
    }
      //por implementar
    });
  };
}

void Function(
  Store<AppState> store,
  LoadMessageRequestAction action,
  NextDispatcher next,
) _fetchMessageDetail(AppRepositoryAbs appRepository) {
  return (store, action, NextDispatcher next) async {
    next(action);
    appRepository.fetchMessageDetail(store.state.currentUser, action.messageId).then((data) {
      store.dispatch(LoadMessageResponseAction(data));
    }).catchError((onError) {
      //store.dispatch(ErrorExceptionResponseAction(onError));
    });
  };
}
