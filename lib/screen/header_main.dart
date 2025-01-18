import 'package:do_an_ban_mt/screen/search_screen.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/msii.png',
                    height: 30.0,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Nhóm Doube H',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/zalo.png',
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
