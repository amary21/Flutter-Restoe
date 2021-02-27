import 'package:flutter/material.dart';
import 'package:restoe/common/styles.dart';
import 'package:restoe/view/resto_detail_page.dart';
import 'package:restoe/view/resto_list_page.dart';
import 'package:restoe/view/resto_splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoe',
      theme: ThemeData(
        primaryColor: secondaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: secondaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
      ),
      initialRoute: RestoSplashPage.routeName,
      routes: {
        RestoSplashPage.routeName: (context) => RestoSplashPage(),
        RestoListPage.routeName: (context) => RestoListPage(),
        RestoDetailPage.routeName: (context) => RestoDetailPage(
              id: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
