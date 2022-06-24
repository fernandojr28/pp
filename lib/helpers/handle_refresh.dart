import 'package:pp/models/app_state.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

Future handleRefresh(context) async {
  final action = PullRefreshRequestAction();
  StoreProvider.of<AppState>(context).dispatch(action);
  return action.completer.future;
}
