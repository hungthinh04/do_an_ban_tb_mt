import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"icon": "assets/images/laptop.png", "label": "Laptop"},
    {"icon": "assets/images/apple.png", "label": "Sản phẩm Apple"},
    {"icon": "assets/images/pc.png", "label": "PC - Máy tính bàn"},
    {"icon": "assets/images/electronics.png", "label": "Điện máy"},
    {"icon": "assets/images/home_appliances.png", "label": "Điện gia dụng"},
    {"icon": "assets/images/monitor.png", "label": "Màn hình"},
    {"icon": "assets/images/computer_parts.png", "label": "Linh kiện máy tính"},
    {"icon": "assets/images/gaming_gear.png", "label": "Gaming Gear"},
    {"icon": "assets/images/computer_accessories.png", "label": "Phụ kiện máy tính"},
    {"icon": "assets/images/phone_accessories.png", "label": "Điện thoại & Phụ kiện"},
    {"icon": "assets/images/accessories.png", "label": "Phụ kiện"},
    {"icon": "assets/images/audio_device.png", "label": "Thiết bị âm thanh"},
    {"icon": "assets/images/office_devices.png", "label": "Thiết bị văn phòng"},
    {"icon": "assets/images/enterprise_solutions.png", "label": "Giải pháp doanh nghiệp"},
    {"icon": "assets/images/apple_logo.png", "label": "Apple"},
    {"icon": "assets/images/dell_logo.png", "label": "Dell"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.blue,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Bạn muốn mua gì hôm nay...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage(categories[index]['icon']!),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      categories[index]['label']!,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CategoriesSection extends StatefulWidget {
//   @override
//   _CategoriesSectionState createState() => _CategoriesSectionState();
// }

// class _CategoriesSectionState extends State<CategoriesSection> {
//   // API URL
//   final String apiUrl = "https://api.example.com/categories";

//   // Function to fetch categories
//   Future<List<Category>> fetchCategories() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List data = json.decode(response.body);
//       return data.map((item) => Category.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load categories');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             color: Colors.blue,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Bạn muốn mua gì hôm nay...",
//                 filled: true,
//                 fillColor: Colors.white,
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           // Categories Grid
//           Expanded(
//             child: FutureBuilder<List<Category>>(
//               future: fetchCategories(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Failed to load categories'));
//                 } else {
//                   final categories = snapshot.data!;
//                   return GridView.builder(
//                     padding: EdgeInsets.all(8.0),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       crossAxisSpacing: 16.0,
//                       mainAxisSpacing: 16.0,
//                     ),
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundColor: Colors.grey[200],
//                             backgroundImage: NetworkImage(categories[index].icon),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text(
//                             categories[index].label,
//                             style: TextStyle(fontSize: 12),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Category Model
// class Category {
//   final String icon;
//   final String label;

//   Category({required this.icon, required this.label});

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       icon: json['icon'],
//       label: json['label'],
//     );
//   }
// }
