/*
- Stream is a sources of asynchronous data events.
- Stream builder class a widget rebuilding is scheduled by each interaction, using State.setState, but is otherwise decoupled from the timing of the stream.
 The builder is called at the discretion of the Flutter pipeline, and will thus receive a timing-dependent sub-sequence of the snapshots that represent the interaction with the stream.

here it is an example of processing a firebase interaction with a stream builder.

11.10.2021 - Huseyin Uslu
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static final String id = "ChatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fS = FirebaseFirestore.instance;
  String message = "";
  User loggedInUser;

  void getCurrentUser() async {
    try {
      final User user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    getCurrentUser();
    super.initState();
  }

  void messagesStream() async {
    await for (var snapshot in _fS.collection("messages").snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                messagesStream();
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _fS.collection("messages").snapshots(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data.docs;
                List<Text> textWidgets = [];
                for (var msg in messages) {
                  final messageText = msg["text"];
                  final messageComeFrom = msg["sender"];
                  textWidgets.add(Text("$messageText from $messageComeFrom"));
                }
                return Column(children: textWidgets);
              }),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _fS
                          .collection("messages")
                          .add({"text": message, "sender": loggedInUser.email});
                      setState(() {
                        //TODO: That textfield must get empty.
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
