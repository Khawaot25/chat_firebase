import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/pages/login_page.dart';
import 'package:chatapp_firebase/pages/profile_page.dart';
import 'package:chatapp_firebase/pages/search_page.dart';
import 'package:chatapp_firebase/service/authen_service.dart';
import 'package:chatapp_firebase/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  AuthenService authenService = AuthenService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunction.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getUserNameFromSF().then((value) {
      setState(() {
        userName = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                context,
                SearchPage(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text(
          'Groups',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      // 3 Tap AppBar

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
              userName,
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
              onTap: () {},
              selectedColor: Theme.of(context).primaryColorDark,
              selected: true,
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
                nextScreen(context, ProfilePage());
              },
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
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Logout'),
                      );
                    });
                authenService.signOut().whenComplete(() {
                  nextScreenReplace(context, LoginPage());
                });
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
    );
  }
}
