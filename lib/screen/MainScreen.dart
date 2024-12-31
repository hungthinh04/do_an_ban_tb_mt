import 'package:do_an_ban_mt/screen/categories_section.dart';
import 'package:do_an_ban_mt/screen/login_screen.dart';
import 'package:do_an_ban_mt/screen/product_list_section';
import 'package:do_an_ban_mt/screen/register_screen.dart';
import 'package:do_an_ban_mt/widgets/banner_slider.dart';
import 'package:do_an_ban_mt/widgets/featured_section.dart';
import 'package:do_an_ban_mt/widgets/footer.dart';
import 'package:do_an_ban_mt/widgets/header.dart';
import 'package:flutter/material.dart';
import 'product_list_screen.dart';
import 'add_product_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                'ĐĂNG KÝ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                'ĐĂNG NHẬP',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            
            Header(),
            BannerSlider(),
            // FeaturedSection(),
            CategoriesSection(),
            // ProductListSection(),
            Footer(), 
             
          ],
        ),
      ),
    );
  }
}




