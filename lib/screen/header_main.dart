import 'package:do_an_ban_mt/screen/search_screen.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 
                  Image.asset(
                    'assets/images/banner1.jpg', 
                    height: 30.0,
                  ),
                  const SizedBox(width: 10,),
                   Text('PhongVuApp - Clone',style: TextStyle(color: Colors.white,fontSize: 20 ),),
                ],
              ),
              
              Image.asset(
                'assets/images/vn_flag.png', 
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SearchScreen() ));
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
