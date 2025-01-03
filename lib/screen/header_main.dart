import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Màu nền header
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo và ZaloPay
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 
                  Image.asset(
                    'assets/images/banner1.jpg', // Thay bằng logo của bạn
                    height: 30.0,
                  ),
                  const SizedBox(width: 10,),
                   Text('HT team',style: TextStyle(color: Colors.white,fontSize: 20 ),),
                ],
              ),
              
              Image.asset(
                'assets/images/banner2.png', // Biểu tượng ZaloPay
                height: 20.0,
              ),
            ],
          ),
          SizedBox(height: 25.0),

          // Thanh tìm kiếm
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                SizedBox(width: 16.0),
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bạn muốn mua gì hôm nay...',
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      //searchPage(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
