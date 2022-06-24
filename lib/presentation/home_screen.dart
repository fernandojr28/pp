import 'package:pp/containers/message_container.dart';
import 'package:pp/presentation/tab_message.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MessageContainer(
            builder: (BuildContext context, vm) {
              return TabMessage(
                onInitMessage: vm.onInitMessage,
                messages: vm.messages
              );
            }
          )
        ],
      ),
    );
  }
}