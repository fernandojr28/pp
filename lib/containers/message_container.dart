import 'package:pp/models/app_state.dart';
import 'package:pp/models/message.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MessageContainer extends StatelessWidget {

  const MessageContainer({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, _ViewModel vm) builder;

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store, context);
      },
      builder: builder,
    );
  }
}

class _ViewModel{

  _ViewModel({
    required this.onInitMessage,
    required this.messages,
  });
  
  final VoidCallback onInitMessage;
  final List<Message> messages;

  static fromStore(Store<AppState> store, BuildContext context) => _ViewModel(
    messages: store.state.messages,
    onInitMessage: () => store.dispatch(FetchMessagesRequest()),
  );
}