import 'package:pp/abstract/user_repository_abs.dart';
import 'package:pp/models/models.dart';
import 'package:pp/routes.dart';
import 'package:redux/redux.dart';
import 'package:pp/models/app_state.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

List<Middleware<AppState>> createAuthMiddleware(
  GlobalKey<NavigatorState> navigatorKey,
  UserRepositoryAbs userRepository
) {
  return [

    TypedMiddleware<AppState, SignInWithGoogleAndPasswordRequestAction>(
      _loInWithGoogleMiddleware(userRepository)),

    TypedMiddleware<AppState, LogInSuccessfulResponseAction>(
        _loadUserData(userRepository)),

    TypedMiddleware<AppState, LoadUserDataSuccessResponseAction>(
        _navigate(userRepository, navigatorKey)),

    TypedMiddleware<AppState, LogInRequiredAction>(
        _navigate(userRepository, navigatorKey)),
  ];
}

void Function(
  Store<AppState> store,
  SignInWithGoogleAndPasswordRequestAction action,
  NextDispatcher next,
) _loInWithGoogleMiddleware(UserRepositoryAbs userRepository) {
  return (store, action, NextDispatcher next) async {
    userRepository.signInWithGoogle().then((user) {
      store.dispatch(LogInSuccessfulResponseAction(user));
    }).catchError((onError) {
      store.dispatch(LogInFailResponseAction(onError));
    }).whenComplete(() {
      next(action);
    });
  };
}



void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next
) _loadUserData(UserRepositoryAbs repository) {
  return (store, action, next) {
    repository
        .fetchUserData(action.user ?? store.state.currentUser)
        .then((userApp) {
        if (kDebugMode) {
          //print(jsonEncode(userApp));
        }
        store.dispatch(LoadUserDataSuccessResponseAction(userApp));
    
      }).catchError((handleError) {
      store.dispatch(LogInRequiredAction());
    }).whenComplete(() {
      next(action);
    });
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next
) _navigate(UserRepositoryAbs repository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) {
    next(action);
    if (action is LoadUserDataSuccessResponseAction) {
      navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
    }
    if (action is LogInRequiredAction) {
      //navigatorKey.currentState?.pushReplacementNamed(AppRoutes.authIntermediate);
    }
  };
}