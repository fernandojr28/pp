import 'package:flutter/foundation.dart';
class Message {
  final String threadId;
  final String from;
  final String subject;
  final String date;
  final String? bodyOrigin;
  final String? bodyPrint;
  final bool isComplete;

  Message({
    this.threadId = "",
    this.from = "",
    this.subject = "",
    this.date = "",
    this.bodyOrigin = "",
    this.bodyPrint = "",
    this.isComplete = false
  });

  factory Message.initState() => Message(
    isComplete: false,
  );

  Message copyWith({
    bool isComplete = false,
  }) => Message(
    isComplete: isComplete,
  );

  static Message fromJson(Map<String, dynamic>? json){
    if(json == null) {
      return Message();
    }
    String subject = json['headers']['subject'].toString();
    String resultText = (subject.length < 30) ? subject : subject.substring(0, 30);
    if (kDebugMode) {
      print("model message");
      print(json);
    }
    return Message(
      isComplete: true,
      threadId:  json['threadId'].toString(),
      from: json['headers']['from'],
      subject: "$resultText...",
      date: json['headers']['date'],
      bodyOrigin: json['body_origin'],
      bodyPrint: json['body_print']
    );
  }
}
