import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/navigation_menu.dart';

class CategoriesSection extends StatefulWidget {
  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  // API URL
  final String apiUrl = "http://localhost:3000/products";

  // Function to fetch categories
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Danh mục sản phẩm", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.blue,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Bạn muốn mua gì hôm nay...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Categories Grid
          Expanded(
            child: FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load categories'));
                } else {
                  final categories = snapshot.data!;
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Tăng kích thước item bằng cách giảm số cột
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8, // Điều chỉnh tỷ lệ để làm item lớn hơn
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 50, // Tăng kích thước hình ảnh
                            backgroundColor: Colors.grey[200],
                            backgroundImage: NetworkImage(categories[index].icon),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            categories[index].label,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}

// Category Model
class Category {
  final String icon;
  final String label;

  Category({required this.icon, required this.label});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      icon: json['Image'],
      label: json['ProductName'],
    );
  }
}
