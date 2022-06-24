import 'package:pp/models/message.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final messageReducer = combineReducers<List<Message>>([
  TypedReducer<List<Message>, LoadMessageResponseAction>(_setData)
]);

List<Message> _setData(
    List<Message> messages, LoadMessageResponseAction action) {
  List<Message> all = List<Message>.from(messages);
  all.removeWhere((t) => t.threadId == action.message.threadId);
  all.add(action.message);
  return all;
}