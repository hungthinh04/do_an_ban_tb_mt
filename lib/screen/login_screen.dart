import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Nhập'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Trang đăng nhập',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}