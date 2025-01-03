import 'package:do_an_ban_mt/routes.dart';
import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      title: 'BetShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
