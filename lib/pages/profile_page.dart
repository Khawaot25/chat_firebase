// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:chatapp_firebase/pages/login_page.dart';
import 'package:chatapp_firebase/service/authen_service.dart';
import 'package:chatapp_firebase/widgets/widget.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({
    Key? key,
    required this.userName,
    required this.email,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthenService authenService = AuthenService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 130,
              color: Colors.grey[700],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.userName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              onTap: () {
                nextScreen(context, HomePage());
              },
              selectedColor: Theme.of(context).primaryColorDark,
              // selected: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              leading: Icon(Icons.group),
              title: Text(
                'Groups',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () async {
                nextScreen(
                    context,
                    ProfilePage(
                      email: widget.email,
                      userName: widget.userName,
                    ));
              },
              selected: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('LogOut'),
                        content: Text('Logout?'),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await authenService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            },
                            icon: Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
                // authenService.signOut().whenComplete(() {
                //   nextScreenReplace(context, LoginPage());
                // });
              },
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  widget.userName,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
