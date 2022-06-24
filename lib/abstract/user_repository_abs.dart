import 'dart:async';
import 'package:pp/models/user_app.dart';

abstract class UserRepositoryAbs {
  Future<UserApp> signInWithGoogle();
  Future<UserApp> fetchUserData(UserApp currentUser);
}