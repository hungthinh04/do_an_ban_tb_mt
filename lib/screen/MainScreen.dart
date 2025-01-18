import 'package:do_an_ban_mt/api/api_service.dart';
import 'package:do_an_ban_mt/screen/header_main.dart';
import 'package:do_an_ban_mt/widgets/banner_slider.dart';
import 'package:do_an_ban_mt/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:do_an_ban_mt/screen/product_detail_screen.dart';
import 'package:do_an_ban_mt/screen/search_screen.dart'; // Thêm SearchScreen vào đây

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List categories = [];
  List products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final fetchedCategories = await ApiService.fetchProductsSTT();
      final response = await http.get(Uri.parse('https://dc5a-115-79-202-156.ngrok-free.app/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List fetchedProducts = data.map((product) {
          return {
            'product_id': product['product_id'],
            'name': product['name'],
            'description': product['description'],
            'price': product['price'],
            'image_url': product['image_url'],
            'stock': product['stock'],
          };
        }).toList();

        setState(() {
          categories = fetchedCategories;
          products = fetchedProducts;
          isLoading = false;
        });
      } else {
        print('Error fetching products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeader(),
                  BannerSlider(),
                  SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Sản phẩm nổi bật",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product['image_url'],
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                product['name'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Tồn kho: ' + product['stock'].toString(),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Giá: ${product['price']} VNĐ',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}
