import 'package:do_an_ban_mt/api/api_service.dart';
import 'package:do_an_ban_mt/models/product.dart';
import 'package:do_an_ban_mt/screen/header_main.dart';
import 'package:do_an_ban_mt/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/banner_slider.dart';
import '../widgets/navigation_menu.dart';

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
      final fetchedCategories = await ApiService.fetchCategories();
      final fetchedProducts = await ApiService.fetchProductsSTT();
      setState(() {
        categories = fetchedCategories;
        products = fetchedProducts;
        isLoading = false;
      });
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
                  // Header Section
                  MainHeader(),

                  // Banner Slider
                  BannerSlider(),

                  // Categories Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Danh mục nổi bật",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 80,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey[200],
                                child: Icon(Icons.category),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                categories[index]['CategoryName'],
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Deals Section (Placeholder Data)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ưu đãi hấp dẫn",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/vn_flag.png', // Replace with dynamic data if available
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Deal $index",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Products Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sản phẩm nổi bật",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
  return GestureDetector(
    onTap: () {
  try {
    final product = Product.fromJson(products[index]); // Chuyển từ Map sang Product
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  } catch (e) {
    print('Error parsing product: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load product details')),
    );
  }
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
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              products[index]['Image'] ?? 'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            products[index]['ProductName'],
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            "${products[index]['Price']}đ",
            style: TextStyle(fontSize: 12, color: Colors.red),
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
