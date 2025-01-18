import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:do_an_ban_mt/models/cart_provider.dart';
import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:do_an_ban_mt/screen/management_order.dart';
import 'package:do_an_ban_mt/widgets/navigation_menu.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String selectedLetter = 'Tất cả'; // Giá trị mặc định hiển thị tất cả

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    // Lọc sản phẩm dựa trên ký tự đầu tiên của tên
    final filteredItems = selectedLetter == 'Tất cả'
        ? cartItems
        : cartItems.where((item) {
            return item['name']
                .toString()
                .toLowerCase()
                .startsWith(selectedLetter.toLowerCase());
          }).toList();

    // Tính tổng tiền
    double totalCartPrice = filteredItems.fold(0.0, (sum, item) {
      return sum + (item['price'].toDouble() * item['quantity']);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
        automaticallyImplyLeading: false,
        actions: [
          DropdownButton<String>(
  value: selectedLetter,
  items: [
    DropdownMenuItem(
      value: 'Tất cả',
      child: Text('Tất cả'),
    ),
    ...'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((char) {
      return DropdownMenuItem(
        value: char,
        child: Text(char),
      );
    }).toList(),
  ],
  onChanged: (value) {
    setState(() {
      selectedLetter = value!;
    });
  },
),

        ],
      ),
      body: filteredItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cart_buying.png', height: 150),
                  SizedBox(height: 16.0),
                  Text("Không có sản phẩm nào phù hợp", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    child: Text("Mua sắm ngay"),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                double price = item['price'].toDouble();
                double totalPrice = price * item['quantity']; // Tính tổng giá cho mỗi sản phẩm

                return ListTile(
                  title: Text(item['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price: ${price.toStringAsFixed(2)} VNĐ"),
                      Text("Total: ${totalPrice.toStringAsFixed(2)} VNĐ"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          cartProvider.increaseQuantity(index);
                        },
                      ),
                      Text(" ${item['quantity']} "),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          cartProvider.decreaseQuantity(index);
                        },
                      ),
IconButton(
  icon: Icon(Icons.delete),
  onPressed: () {
    cartProvider.removeItemByIndex(index);
  },
),

                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tổng tiền:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${totalCartPrice.toStringAsFixed(2)} VNĐ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartProvider.checkout(); // Thanh toán và xóa giỏ hàng
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Thanh toán thành công!")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchasedOrdersScreen(
                            purchasedOrders: cartProvider.purchasedOrders,
                          ),
                        ),
                      );
                    },
                    child: Text("Thanh toán"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartProvider.clearCart(); // Hủy đơn và xóa giỏ hàng
                    },
                    child: Text("Hủy đơn"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            NavigationMenu(), // Đưa NavigationMenu vào cuối
          ],
        ),
      ),
    );
  }
}
