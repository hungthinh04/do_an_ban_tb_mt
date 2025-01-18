import 'package:do_an_ban_mt/models/cart_provider.dart';
import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:do_an_ban_mt/screen/management_order.dart';
import 'package:do_an_ban_mt/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Mở màn hình lọc đơn hàng
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cart_buying.png', height: 150),
                  SizedBox(height: 16.0),
                  Text("Bạn chưa có sản phẩm nào trong giỏ", style: TextStyle(fontSize: 16)),
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
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                double price = item['price'].toDouble();
                double totalPrice = price * item['quantity']; // Tính tổng giá cho mỗi sản phẩm

                return ListTile(
                  title: Text(item['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price: \$${price.toStringAsFixed(2)}"),
                      Text("Total: \$${totalPrice.toStringAsFixed(2)}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            cartProvider.decreaseQuantity(item['id']); // Giảm số lượng
                          });
                        },
                      ),
                      Text("Quantity: ${item['quantity']}"),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cartProvider.increaseQuantity(item['id']); // Tăng số lượng
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            cartProvider.removeItem(item['id']); // Xóa sản phẩm
                          });
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
