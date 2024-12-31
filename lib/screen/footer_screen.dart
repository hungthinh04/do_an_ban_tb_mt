import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo hoặc Tên Thương hiệu
          const Text(
            'BETASHOP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Các liên kết
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Liên kết bên trái
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Liên kết nhanh',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Giới thiệu',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Liên hệ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Hỗ trợ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              // Liên kết bên phải
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Chính sách',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Chính sách bảo mật',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Chính sách đổi trả',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Điều khoản dịch vụ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Bản quyền
          const Center(
            child: Text(
              '© 2024 BETASHOP - All rights reserved.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
