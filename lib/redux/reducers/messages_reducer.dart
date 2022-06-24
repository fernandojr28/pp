import 'package:pp/models/message.dart';
import 'package:pp/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final messagesReducer = combineReducers<List<Message>>([
  TypedReducer<List<Message>, FetchMessageResponse>(_setData),
  TypedReducer<List<Message>, LoadMessageResponseAction>(_setData2),
]);

List<Message> _setData(List<Message> request, FetchMessageResponse action) => action.messages;

List<Message> _setData2(
    List<Message> messages, LoadMessageResponseAction action) {
  List<Message> all = List<Message>.from(messages);
  all.removeWhere((t) => t.threadId == action.message.threadId);
  all.add(action.message);
  return all;
}