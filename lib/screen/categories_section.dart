import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// File lib/models/category.dart
class Category {
  final String name;
  final String image;

  // Constructor
  Category({required this.name, required this.image});

  // Phương thức tạo Category từ JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['ProductName'] ?? 'Không có tên',
      image: json['Image'] ?? '',
    );
  }

  // Phương thức chuyển Category thành JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductName': name,
      'Image': image,
    };
  }
}

// File lib/widgets/categories_section.dart
class CategoriesSection extends StatefulWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  late Future<List<Category>> categories;  // Cập nhật kiểu trả về thành Category

  // Hàm lấy dữ liệu danh mục từ API
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('http://localhost:3000/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();  // Trả về danh sách Category
    } else {
      throw Exception('Không thể tải danh mục');
    }
  }

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();  // Gọi hàm lấy danh mục khi khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Danh mục nổi bật',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<Category>>(
            future: categories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Lỗi: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Không có danh mục'));
              } else {
                final categoryList = snapshot.data!;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    final category = categoryList[index];
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(category.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
