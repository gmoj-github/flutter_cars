import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/models/user.dart';
import 'package:flutter_cars/pages/login_page.dart';
import 'package:flutter_cars/utils/navigation.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            FutureBuilder(
                future: User.getFromPreferences(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if(snapshot.hasData){
                    User? user = snapshot.data;
                    _buildUserHeader(user);
                    return user != null ? _buildUserHeader(user) : Container();
                  }
                  return Container();
                }),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 2");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildUserHeader(user) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      accountName: Text(user.name!),
      accountEmail: Text(user.email!),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(user.urlPhoto!),
      ),
    );
  }

  void _onClickLogout(context) {
    User.clear();
    Navigator.pop(context);
    navigate(context, LoginPage(), replace: true);
  }
}
