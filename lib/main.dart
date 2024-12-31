import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:do_an_ban_mt/screen/login_screen.dart';
import 'package:do_an_ban_mt/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/banner_slider.dart';
import 'widgets/featured_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
