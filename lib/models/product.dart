class Product {
  final String name;
  final String brand;
  final String type;
  final double price;
  final int quantityInStock;
  final String description;
  final String image;
  final int categoryId;

  Product({
    required this.name,
    required this.brand,
    required this.type,
    required this.price,
    required this.quantityInStock,
    required this.description,
    required this.image,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['ProductName'] ?? 'Unknown', // Mặc định 'Unknown' nếu null
      brand: json['Brand'] ?? 'Unknown', // Mặc định 'Unknown' nếu null
      type: json['Type'] ?? 'Unknown', // Mặc định 'Unknown' nếu null
      price: (json['Price'] ?? 0).toDouble(), // Mặc định là 0 nếu null
      quantityInStock: json['QuantityInStock'] ?? 0, // Mặc định là 0 nếu null
      description: json['Description'] ?? 'No description available', // Mặc định 'No description available' nếu null
      image: json['Image'] ?? 'https://via.placeholder.com/150', // URL placeholder nếu null
      categoryId: json['CategoryID'] ?? 0, // Mặc định là 0 nếu null
    );
  }
}
