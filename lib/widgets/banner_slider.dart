import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.png',
    ];

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Image.asset(
            banners[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
