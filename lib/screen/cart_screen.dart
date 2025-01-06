import 'package:do_an_ban_mt/screen/MainScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_menu.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cart_buying.png', height: 150), // Đặt ảnh phù hợp
            SizedBox(height: 16.0),
            Text("Bạn chưa có sản phẩm nào trong giỏ", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Correct navigation to MainScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Text("Mua sắm ngay"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}


// class CartScreen extends StatelessWidget {
//   final Product product;
//   final int quantity;

//   const CartScreen({Key? key, required this.product, required this.quantity}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = product.price * quantity;

//     return Scaffold(
     
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Your Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey[200],
//                   ),
//                   child: product.image.isNotEmpty
//                       ? Image.network(product.image, fit: BoxFit.cover)
//                       : Center(child: Text('No Image')),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 8),
//                       Text('Price: \$${product.price.toStringAsFixed(2)}'),
//                       Text('Quantity: $quantity'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Divider(),
//             const SizedBox(height: 16),
//             Text(
//               'Total: \$${totalPrice.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Quay lại trang chi tiết sản phẩm
//                 },
//                 child: Text('Continue Shopping', style: TextStyle(fontSize: 18)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
