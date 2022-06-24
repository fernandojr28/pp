
import 'package:pp/models/user_app.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final userAppReducer = combineReducers<UserApp?>([
  TypedReducer<UserApp?, LoadUserDataSuccessResponseAction>(_setUserData),
  //TypedReducer<UserApp?, LoadUserDataSuccessResponseAction>(_cleanUser),
]);

UserApp? _setUserData(UserApp? currentUser, LoadUserDataSuccessResponseAction action) => action.user;

//UserApp? _cleanUser(UserApp? state, action) => null;
