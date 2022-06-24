import 'package:pp/containers/message_detail_container.dart';
import 'package:pp/presentation/message_detail.dart';
import 'package:flutter/material.dart';

class MessageDetailScreen extends StatelessWidget {
  
  const MessageDetailScreen({
    Key? key,
    required this.messageId
  }) : super(key: key);

  final String messageId;

  @override
  Widget build(BuildContext context) {
    return MessageDetailContainer(
      messageId: messageId,
      builder: (BuildContext context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalle de mensaje'),
            centerTitle: true,
          ),
          body: MessageDetail(
            message: vm.message,
            onLoadMessage: vm.onLoadMessage
          ),
        );
      });
  }
}