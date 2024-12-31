class Product {
  final int id;
  final String name;
  final String brand;
  final String processor;
  final String ram;
  final String storage;
  final double price;
  final int quantityInStock;
  final String description;
  final String image;
  final int? categoryId;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.price,
    required this.quantityInStock,
    required this.description,
    required this.image,
    this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ProductID'],
      name: json['ProductName'],
      brand: json['Brand'],
      processor: json['Processor'],
      ram: json['RAM'],
      storage: json['Storage'],
      price: json['Price'].toDouble(),
      quantityInStock: json['QuantityInStock'],
      description: json['Description'],
      image: json['Image'],
      categoryId: json['CategoryID'] != null ? json['CategoryID'] : null, 
    );
  }
}
