import 'package:chatapp_firebase/service/group_info.dart';
import 'package:chatapp_firebase/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  ChatPage(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;
  String admin = "";
  @override
  void initState() {
    getChatandAdmin();
    super.initState();
  }

  getChatandAdmin() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                  context,
                  GroupInfo(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: admin));
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
