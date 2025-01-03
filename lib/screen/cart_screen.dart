import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cart_buying.png', height: 150), // Đặt ảnh phù hợp
            SizedBox(height: 16.0),
            Text("Bạn chưa có sản phẩm nào trong giỏ", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Correct navigation to MainScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Text("Mua sắm ngay"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}
