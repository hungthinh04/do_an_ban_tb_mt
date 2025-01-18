import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  Future<void> registerUser(BuildContext context, String username, String password, String email, String phone, String address, String role) async {
    const apiUrl = 'https://dc5a-115-79-202-156.ngrok-free.app/register';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
        'phone': phone,
        'address': address,
        'role': role,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đăng ký thành công!')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: ${responseBody['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng ký thất bại, vui lòng thử lại.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final roleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tên người dùng
            _buildTextField(
              controller: usernameController,
              labelText: 'Tên người dùng',
            ),
            const SizedBox(height: 16),
            
            // Email
            _buildTextField(
              controller: emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            
            // Số điện thoại
            _buildTextField(
              controller: phoneController,
              labelText: 'Số điện thoại',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            
            // Địa chỉ
            _buildTextField(
              controller: addressController,
              labelText: 'Địa chỉ',
            ),
            const SizedBox(height: 16),
            
            // Chức vụ
            _buildTextField(
              controller: roleController,
              labelText: 'Chức vụ',
            ),
            const SizedBox(height: 16),
            
            // Mật khẩu
            _buildTextField(
              controller: passwordController,
              labelText: 'Mật khẩu',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            
            // Nút đăng ký
            ElevatedButton(
              onPressed: () {
                registerUser(
                  context,
                  usernameController.text,
                  passwordController.text,
                  emailController.text,
                  phoneController.text,
                  addressController.text,
                  roleController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Đăng Ký',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm để tạo TextField gọn gàng
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.green),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
