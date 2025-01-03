import 'package:do_an_ban_mt/screen/login_screen.dart';
import 'package:do_an_ban_mt/screen/register_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        
        children: [
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Add your logic for the "Đăng ký / Đăng nhập" button here
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen() ));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng ký / Đăng nhập',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 1, 38, 69),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Expanded Section with Gray Background
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              color: Colors.grey[200], // Gray background for the entire section
              child: Column(
                children: [
                  // Content with White Background
                  Container(
                    color: Colors.white,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                        
                          children: [
                             ListTile(
                              
                          leading: Icon(Icons.person),
                          title: Text('Giới thiệu bạn bè'),
                        ),
                        ListTile(
                          leading: Icon(Icons.history),
                          title: Text('Lịch sử điểm thành viên'),
                        ),
                          ],
                        ),
                        SizedBox(height: 10,
                        child: Container(color: Colors.grey[200],), ),
                        Column(
                          children: [
 ListTile(
                          leading: Icon(Icons.shopping_bag),
                          title: Text('Quản lý đơn hàng'),
                        ),
                        ListTile(
                          leading: Icon(Icons.language),
                          title: Text('Thay đổi ngôn ngữ'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/vn_flag.png', width: 40),
                              SizedBox(width: 5),
                              Text('Tiếng Việt'),
                            ],
                          ),
                        ),
                          ],
                        ),
                         SizedBox(height: 10,
                        child: Container(color: Colors.grey[200],), ),
                        Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.local_offer),
                              title: Text('Khuyến mãi Hot'),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: Text('Hỗ trợ 0123456789'),
                              onTap: () {},
                            ),
                          ],
                        ),
                        ListTile(
                          leading: Icon(Icons.policy),
                          title: Text('Chính sách và điều khoản'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}
