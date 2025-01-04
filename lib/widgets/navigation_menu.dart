import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:do_an_ban_mt/screen/cart_screen.dart';
import 'package:do_an_ban_mt/screen/categories_section.dart';
import 'package:do_an_ban_mt/screen/notification_screen.dart';
import 'package:do_an_ban_mt/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  final int initialIndex;

  NavigationMenu({this.initialIndex = 0});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => _getPage(index),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
    else{
     
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => _getPage(index),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MainScreen();
      case 1:
        return CategoriesSection();
      case 2:
        return CartScreen();
      case 3:
        return NotificationsScreen();
      case 4:
        return ProfileScreen();
      default:
        return MainScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Danh mục',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Giỏ hàng',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cá nhân',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
