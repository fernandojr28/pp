import 'package:pp/models/models.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

@immutable
class AppState{

  final bool isLoading;
  final UserApp? currentUser;
  final List<Message> messages;
  final PlatformException? platformException;

  const AppState({
    this.isLoading = false,
    this.currentUser,
    this.platformException,
    this.messages = const []
  });

  factory AppState.loading() =>  const AppState(
    isLoading: true
  );

  static AppState fromJson(dynamic json) {
    if (json == null) {
      return AppState.loading();
    } else {
      return AppState.loading().copyWith(
        currentUser: UserApp.fromJson(json['current_user']),
      );
    }
  }

  AppState copyWith({
    bool? isLoading,
    UserApp? currentUser,
    PlatformException? platformException,
    List<Message>? messages,
    Message? message
  }) => 
  AppState(
    isLoading: isLoading ?? this.isLoading,
    currentUser: currentUser ?? this.currentUser,
    platformException: platformException ?? this.platformException,
    messages: messages ?? this.messages
  );
}

