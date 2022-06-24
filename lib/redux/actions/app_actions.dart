import 'dart:async';

import 'package:pp/models/message.dart';

class InitAppAction{
  InitAppAction();
}

class FetchMessageResponse{
  final List<Message> messages;

  FetchMessageResponse(this.messages);
}

class FetchMessagesRequest {}


class PullRefreshRequestAction {
  final Completer completer;

  PullRefreshRequestAction({Completer? completer})
      : completer = completer ?? Completer();
}


class LoadMessageRequestAction {
  final String messageId;
  LoadMessageRequestAction(this.messageId);
}

class LoadMessageResponseAction {
  final Message message;
  LoadMessageResponseAction(this.message);
}