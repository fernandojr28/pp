import 'package:pp/helpers/handle_refresh.dart';
import 'package:pp/models/message.dart';
import 'package:pp/models/app_state.dart';
import 'package:pp/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TabMessage extends StatefulWidget {
  const TabMessage(
      {Key? key, required this.onInitMessage, required this.messages})
      : super(key: key);

  final VoidCallback onInitMessage;
  final List<Message> messages;

  @override
  State<TabMessage> createState() => _TabMessageState();
}

class _TabMessageState extends State<TabMessage> {

  @override
  void initState() {
    widget.onInitMessage();
    super.initState();
  }

  _navigateToDetail(String id) {
    StoreProvider.of<AppState>(context).dispatch(
      Navigator.of(context).pushNamed("${AppRoutes.messageDetail}/$id"));
  }

  @override
  Widget build(BuildContext context) {
    List<Message> items = List<Message>.from(widget.messages);
    return Scaffold(
        appBar: AppBar(
          title: const Text("MENSAJES"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.bug_report_sharp))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => handleRefresh(context),
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final Message mess = items[index];
                return Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // CircleAvatar(
                        //   radius: 30.0,
                        //   backgroundImage: NetworkImage(
                        //     users[position]['threadId'],
                        //   ),
                        // ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      (mess.threadId),
                                      style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                          fontSize: 17.0),
                                    ),
                                    // Text(
                                    //   (users[position]['threadId']),
        
                                    //   // f.format(DateTime.fromMillisecondsSinceEpoch(users[position]["headers"]["date"]*1000)),
                                    //   style: const TextStyle(
                                    //     fontFamily: 'Montserrat',
                                    //     fontWeight: FontWeight.w400,
                                    //     color: Colors.black54,
                                    //     fontSize: 13.5),
                                    // ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            // overflow: TextOverflow.ellipsis,
                                            (mess.from),
                                            style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54,
                                                fontSize: 15.5),
                                          ),
                                        ),
        
                                        Text(
                                          (mess.subject),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                            fontSize: 15.5),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      icon:
                                          const Icon(Icons.remove_red_eye_sharp),
                                      // highlightColor:
                                      onPressed: () => _navigateToDetail(mess.threadId),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ]);
              }),
              
        ));


  }

  //Widget _messageListView(items) {
  //}
}
