import 'package:chatapp_firebase/pages/chat_page.dart';
import 'package:chatapp_firebase/widgets/widget.dart';
import 'package:flutter/material.dart';

class GroupItem extends StatefulWidget {
  final String username;
  final String groupId;
  final String groupName;
  GroupItem(
      {Key? key,
      required this.username,
      required this.groupId,
      required this.groupName})
      : super(key: key);

  @override
  State<GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
          context,
          ChatPage(
            groupId: widget.groupId,
            groupName: widget.groupName,
            userName: widget.username,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          title: Text(
            widget.groupName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'เข้าห้องแชทเพิ่อสนทนา ${widget.username}',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
