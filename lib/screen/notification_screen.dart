import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class NotificationsScreen extends StatelessWidget {
  // Dữ liệu giả định cho các thông báo
  final List<Map<String, String>> notifications = List.generate(20, (index) {
    return {
      'title': 'Thông báo ${index + 1}',
      'message': 'Thông báo ${index + 1}',
      'time': '2 giờ trước',
    };
  });

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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: notifications.isEmpty
            ? Center(
                child: Text(
                  "Bạn chưa có thông báo nào.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  var notification = notifications[index];
                  bool isYellowBackground = [0, 3, 6, 9, 12, 15, 18].contains(index); // Các trang cần có màu vàng nhạt

                  return GestureDetector(
                    onTap: () {
                      // Khi nhấn vào thông báo, điều hướng đến màn hình chi tiết
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetailScreen(
                            title: notification['title']!,
                            message: notification['message']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: isYellowBackground ? Colors.yellow[50] : Colors.white, // Thêm màu vàng nhạt
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text(
                          notification['title']!,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          notification['message']!,
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        trailing: Text(
                          notification['time']!,
                          style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: NavigationMenu(initialIndex: 3),
    );
  }
}

class NotificationDetailScreen extends StatelessWidget {
  final String title;
  final String message;

  // Constructor nhận tiêu đề và mô tả của thông báo
  NotificationDetailScreen({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true, // Cho phép quay lại
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Sử dụng Text.rich để làm cho mô tả dài hơn dễ đọc
            Text(
              '2 giờ trước',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.justify,  // Căn lề cho phần mô tả dài
            ),
            SizedBox(height: 16),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
