import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/custom_background.dart';
import 'package:bad_tech/screens/auth/welcome_back_page.dart';
import 'package:bad_tech/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MainBackground(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: TextStyle(color: darkGrey),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
                      builder:(builder,constraints)=> SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                   ListTile(
                    title: Text('About Us'),
                     leading: Image.asset('assets/icons/about_us.png'),
                    onTap: (){},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Sign out'),
                      leading: Image.asset('assets/icons/sign_out.png'),
                    onTap: () {
                      _auth.signOut();
                      displayName = "Ligma Sukmadi";
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
                    }
                  ),
                  
                ],
              ),
            ),
                        ),
                      )
          ),
        ),
      ),
    );
  }
}
