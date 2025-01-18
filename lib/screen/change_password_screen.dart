import 'package:do_an_ban_mt/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    final username = _usernameController.text;
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Kiểm tra nếu mật khẩu mới và xác nhận mật khẩu không khớp
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mật khẩu mới và xác nhận mật khẩu không khớp')),
      );
      return;
    }

    try {
  final response = await http.post(
  Uri.parse('https://dc5a-115-79-202-156.ngrok-free.app/change-password'),
  headers: {'Content-Type': 'application/json'},
  body: json.encode({
    'username': username,
    'currentPassword': currentPassword,
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,  // Thêm confirmPassword vào body
  }),
);


  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['success'] == true) {
      // Đăng xuất và xóa dữ liệu người dùng
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Xóa tất cả dữ liệu lưu trữ

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đổi mật khẩu thành công. Bạn đã đăng xuất.')),
      );
      Navigator.pushReplacementNamed(context, '/login'); // Điều hướng đến màn hình đăng nhập
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'] ?? 'Đổi mật khẩu thất bại')),
      );
    }
  } else {
    // Log thêm thông tin về lỗi
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Lỗi khi kết nối đến máy chủ')),
    );
  }
} catch (e) {
  print('Error: $e');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Đổi mật khẩu thất bại. Vui lòng thử lại.')),
  );
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đổi Mật Khẩu'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Đổi Mật Khẩu',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Tài khoản',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu hiện tại',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu mới',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Xác nhận mật khẩu mới',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              child: const Text('Đổi Mật Khẩu', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
