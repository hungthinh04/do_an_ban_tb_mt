import 'package:do_an_ban_mt/screen/Detail_categories.dart';
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
  final String apiUrl = "https://dc5a-115-79-202-156.ngrok-free.app/products/name-image";

  Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    print(data); // Add this line to check the response data
    return data.map((item) => Category.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}


  // Function to fetch product details
  Future<Map<String, dynamic>> fetchProductsSTT(String name) async {
    final response =
        await http.get(Uri.parse('https://dc5a-115-79-202-156.ngrok-free.app/products?name=$name'));

    if (response.statusCode == 200) {
      List products = json.decode(response.body);
      return products.isNotEmpty ? products.first : {};
    } else {
      throw Exception('Failed to load product details');
    }
  } 

  // State variable for search query
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Danh mục sản phẩm", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.blue,
            child: TextField(
              controller: _searchController,
              onChanged: (text) {
                setState(() {
                  _searchQuery = text.toLowerCase();
                });
              },
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
                  // Filter categories based on the search query
                  final filteredCategories = categories
                      .where((category) =>
                          category.label.toLowerCase().contains(_searchQuery))
                      .toList();

                  return GridView.builder(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 16.0,
    mainAxisSpacing: 16.0,
    childAspectRatio: 0.8,
  ),
  itemCount: filteredCategories.length,  // Ensure this is the correct count
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () async {
        try {
          final product = await fetchProductsSTT(filteredCategories[index].label);
          if (product.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(product: product),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Không tìm thấy chi tiết sản phẩm')),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi khi tải chi tiết sản phẩm')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(filteredCategories[index].icon),
          ),
          SizedBox(height: 12.0),
          Text(
            filteredCategories[index].label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
      icon: json['image_url'],
      label: json['name'],
    );
  }
}
