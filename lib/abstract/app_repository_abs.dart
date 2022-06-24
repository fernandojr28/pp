import 'dart:async';
import 'package:pp/models/models.dart';

abstract class AppRepositoryAbs {
  Future<List<Message>> getMessages(UserApp? currentUser);
  Future<Message> fetchMessageDetail(UserApp? currentUser, String messageId);
}