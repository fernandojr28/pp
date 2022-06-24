import 'package:pp/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pp/selectors/selectors.dart';
import 'package:pp/redux/actions/actions.dart';


class MessageDetailContainer extends StatelessWidget {

  final Widget Function(BuildContext context, _ViewModel vm) builder;
  final String messageId;

  const MessageDetailContainer({
    Key? key,
    required this.builder,
    required this.messageId
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store, messageId),
      builder: builder,
    );
  }
}

class _ViewModel{

  final VoidCallback onLoadMessage;
  final Message? message;

  _ViewModel({
    required this.onLoadMessage,
    required this.message
  });

  static _ViewModel fromStore(Store<AppState> store, String messageId) {
    final Message? message = messageSelector(store.state.messages, messageId).value;
    return _ViewModel(
      message: message,
      onLoadMessage: () => store.dispatch(LoadMessageRequestAction(messageId)),
    );
  }
}