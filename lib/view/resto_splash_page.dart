import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restoe/view/resto_list_page.dart';

class RestoSplashPage extends StatefulWidget {
  static const routeName = '/resto_splash';

  @override
  _RestoSplashPageState createState() => _RestoSplashPageState();
}

class _RestoSplashPageState extends State<RestoSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RestoListPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/foods.png'),
            Text(
              "Resto'e",
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
                margin: EdgeInsets.all(40.0),
                child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
