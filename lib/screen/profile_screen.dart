import 'package:do_an_ban_mt/models/cart_provider.dart';
import 'package:do_an_ban_mt/screen/change_password_screen.dart';
import 'package:do_an_ban_mt/screen/management_order.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';  // Đảm bảo đường dẫn đúng đến màn hình đăng nhập
import '../widgets/navigation_menu.dart';  // Đảm bảo đường dẫn đúng đến NavigationMenu

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoggedIn = false;
  String _username = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Kiểm tra trạng thái đăng nhập từ SharedPreferences
  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final username = prefs.getString('username') ?? '';
    final email = prefs.getString('email') ?? '';

    setState(() {
      _isLoggedIn = isLoggedIn;
      _username = username;
      _email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggedIn ? _buildProfile() : _buildLoginPrompt(),
      bottomNavigationBar: NavigationMenu(),
    );
  }

  Widget _buildProfile() {
  return Column(
    children: [
      Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn đều
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      // Đăng xuất và chuyển về màn hình đăng nhập
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Đăng xuất",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Đổi mật khẩu",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Chào, $_username', style: TextStyle(fontSize: 24)),
            Text('Email: $_email', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.people, color: Colors.grey),
              title: const Text("Giới thiệu bạn bè"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.grey),
              title: const Text("Lịch sử điểm thành viên"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.grey),
              title: const Text("Quản lý đơn hàng"),
              onTap: () {
                
               },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.grey),
              title: const Text("Thay đổi ngôn ngữ"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Tiếng Việt"),
                  SizedBox(width: 5),
                  Icon(Icons.flag, color: Colors.red),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.grey),
              title: const Text("Khuyến mãi Hot"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.grey),
              title: const Text("Hỗ trợ 0932412321"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.policy, color: Colors.grey),
              title: const Text("Chính sách và điều khoản"),
              onTap: () {},
            ),
          ],
        ),
      ),
    ],
  );
}


  // Hiển thị lời mời đăng nhập nếu chưa đăng nhập
  Widget _buildLoginPrompt() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: const Text(
          "Đăng ký / Đăng nhập",
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ),
    );
  }
}
