import 'package:do_an_ban_mt/models/cart_provider.dart';
import 'package:do_an_ban_mt/models/product.dart';
import 'package:do_an_ban_mt/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;


  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late double quantity;

  @override
  void initState() {
    super.initState();
    quantity = 1;  // Set initial quantity to 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product['image_url'],
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${widget.product['price']}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'Stock: ${widget.product['stock']}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              widget.product['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            
            // Quantity Adjustment
            Row(
  mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều ngang
  children: [
    Expanded(
      child: IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          setState(() {
            if (quantity > 1) {
              quantity--;
            }
          });
        },
      ),
    ),
    Text(
      '$quantity',
      style: TextStyle(fontSize: 20),
    ),
    Expanded(
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            if (quantity < widget.product['stock']) {
              quantity++;
            }
          });
        },
      ),
    ),
  ],
),
            
            
            ElevatedButton(
  onPressed: () {
    // Debug: print product data
    print(widget.product); // Check if the 'id' field exists

    // Add product to cart
    Provider.of<CartProvider>(context, listen: false).addToCart({
      'id': widget.product['id'], // Ensure this id is present
      'name': widget.product['name'],
      'price': widget.product['price'],
      'quantity': quantity,
    });

    // Navigate to CartScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  },
  child: Text("Add to Cart"),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
)


          ],
        ),
      ),
    );
  }
}
