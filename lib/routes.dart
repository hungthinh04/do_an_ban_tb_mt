import 'package:do_an_ban_mt/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:do_an_ban_mt/screen/cart_screen.dart';
import 'package:do_an_ban_mt/screen/categories_section.dart';
import 'package:do_an_ban_mt/screen/notification_screen.dart';
import 'package:do_an_ban_mt/screen/profile_screen.dart';

// Định nghĩa tất cả các route
Map<String, WidgetBuilder> appRoutes = {
  '/main': (context) => MainScreen(),
  '/categories': (context) => CategoriesSection(),
  '/cart': (context) => CartScreen(),
  '/notifications': (context) => NotificationsScreen(),
 '/login': (context) => LoginScreen(),
 '/profile': (context) => ProfileScreen(),
};
