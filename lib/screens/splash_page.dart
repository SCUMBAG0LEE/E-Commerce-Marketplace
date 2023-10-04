import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/screens/auth/welcome_back_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bad_tech/screens/main/main_page.dart';

final _auth = FirebaseAuth.instance;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin:  1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  Future<bool> isUserSignedIn() async {
  try {
    final user = await _auth.authStateChanges().first;
    return user != null;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() async {
  bool userSignedIn = await isUserSignedIn();
  if (userSignedIn) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
  } else {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
  }
}


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/logo1.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'Itits',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
