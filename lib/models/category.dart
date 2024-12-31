// lib/models/category.dart

class Category {
  final String name;
  final String image;

  // Constructor
  Category({required this.name, required this.image});

  // Phương thức tạo Category từ JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['ProductName'] ?? 'Không có tên',
      image: json['Image'] ?? '',
    );
  }

  // Phương thức chuyển Category thành JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductName': name,
      'Image': image,
    };
  }
}
