import 'package:flutter/material.dart';

class PurchasedOrdersScreen extends StatefulWidget {
  final List<Map<String, dynamic>> purchasedOrders;

  PurchasedOrdersScreen({required this.purchasedOrders});

  @override
  _PurchasedOrdersScreenState createState() => _PurchasedOrdersScreenState();
}

class _PurchasedOrdersScreenState extends State<PurchasedOrdersScreen> {
  void addReview(int index, String review) {
    setState(() {
      widget.purchasedOrders[index]['review'] = review;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng đã mua"),
      ),
      body: widget.purchasedOrders.isEmpty
          ? Center(
              child: Text("Chưa có đơn hàng nào được mua."),
            )
          : ListView.builder(
              itemCount: widget.purchasedOrders.length,
              itemBuilder: (context, index) {
                final order = widget.purchasedOrders[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Price: \$${order['price']}"),
                        Text("Quantity: ${order['quantity']}"),
                        if (order['review'] != null) // Hiển thị nhận xét nếu có
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Nhận xét: ${order['review']}",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),
                            ),
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () {
                              // Mở form đánh giá
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String review = '';
                                  return AlertDialog(
                                    title: Text("Đánh giá sản phẩm"),
                                    content: TextField(
                                      onChanged: (value) {
                                        review = value;
                                      },
                                      decoration: InputDecoration(hintText: "Nhập đánh giá của bạn"),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Hủy"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (review.isNotEmpty) {
                                            addReview(index, review); // Lưu nhận xét
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Text("Gửi"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.rate_review),
                            label: Text(order['review'] == null ? "Nhận xét" : "Sửa nhận xét"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
