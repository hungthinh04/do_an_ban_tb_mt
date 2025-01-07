import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
           
            Expanded(
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Tìm kiếm',
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        // borderSide: const BorderSide(
        //   color: Colors.blue, // Màu viền khi TextField được focus
        //   width: 1.5,
        // ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    ),
    style: const TextStyle(color: Colors.grey),
  ),
),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tìm kiếm gần đây
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TÌM KIẾM GẦN ĐÂY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Xóa lịch sử',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.history, color: Colors.grey),
                const SizedBox(width: 8),
                const Text('d'),
              ],
            ),
            const SizedBox(height: 24),
            // Từ khóa phổ biến
            const Text(
              'TỪ KHÓA PHỔ BIẾN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildKeywordChip('ca'),
                _buildKeywordChip('tai nghe'),
                _buildKeywordChip('màn hình'),
                _buildKeywordChip('loq'),
                _buildKeywordChip('asus'),
                _buildKeywordChip('trưng bày'),
                _buildKeywordChip('ma'),
                _buildKeywordChip('máy'),
                _buildKeywordChip('ssd'),
                _buildKeywordChip('chuột'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeywordChip(String text) {
    return Chip(
      label: Text(text),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
    );
  }
}
