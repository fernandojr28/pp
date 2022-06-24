import 'package:pp/models/message.dart';
import 'package:pp/selectors/optional.dart';


Optional<Message> messageSelector(
    List<Message> requests, String id) {
  try {
    return Optional.of(
        requests.firstWhere((t) => t.threadId == id, orElse: () => Message()));
  } catch (e) {
    return const Optional.absent();
  }
}