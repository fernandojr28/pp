import 'package:pp/models/message.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pp/models/app_state.dart';
import 'package:pp/routes.dart';

class MessageDetail extends StatefulWidget {
  const MessageDetail({
    Key? key,
    required this.message,
    required this.onLoadMessage
  }) : super(key: key);

  final VoidCallback onLoadMessage;
  final Message? message;

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {

  Message? get message => widget.message;

  var isComplete = false;

  @override
  void initState() {
    isComplete = widget.message?.isComplete ?? false;
    widget.onLoadMessage();
    super.initState();
  }

  navigateToPrintVoucher(String? id) {
    StoreProvider.of<AppState>(context).dispatch(
        Navigator.of(context).pushNamed("${AppRoutes.printVoucher}/$id"));
  }

  @override
  Widget build(BuildContext context) {
    //bool isComplete = false;
    if (kDebugMode) {
      print("isComplete1");
      print(isComplete);
    }
    return Scaffold(
      body: !isComplete
          // ignore: dead_code
          ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
          children: [
            /*
            Expanded(
              child: Html(
                data: """<table style="width:100%">${message?.bodyPrint}</table>""",
                tagsList: Html.tags,
                style: {
                  "table": Style(
                    //backgroundColor:  Color.,
                  ),
                  "tr": Style(
                    border: const Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  "th": Style(
                    padding: const EdgeInsets.all(6),
                    backgroundColor: Colors.grey,
                  ),
                  "td": Style(
                    padding: const EdgeInsets.all(6),
                    alignment: Alignment.topLeft,
                  ),
                  'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                },
              ),
              
            ),*/
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => navigateToPrintVoucher(message?.threadId),
                    icon: const Icon(Icons.print),
                    label: const Text("IMPRIMIR"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}