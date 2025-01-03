import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        backgroundColor: Colors.white,
        title: Text(
          "Thông báo",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Add sorting/filtering functionality here
              print("Filter icon tapped");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical :8.0),
        child: Column(
          children:[
        Center(
          child: Text(
              "Bạn đã xem hết thông báo rồi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
        ),
          ] 
        ),
      ),
      bottomNavigationBar: NavigationMenu(initialIndex: 3),
    );
  }
}
