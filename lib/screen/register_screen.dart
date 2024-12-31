import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Trang đăng ký',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}