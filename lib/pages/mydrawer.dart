import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/LoginPage.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal.shade100,
      width: 275,
      child: ListView(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Abdul Rahman'),
                accountEmail: Text('abdulrahman@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              )),
          const ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text('Contact'),
          ),
          const ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.exclamationmark_circle),
            title: Text('About'),
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
