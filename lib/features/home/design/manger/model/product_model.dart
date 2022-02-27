import 'dart:convert';

class Product {
  String? image;
  String? name;
  String? category;
  String? details;
  double? price;
  double? isNew;
  Product({
    this.image,
    this.name,
    this.category,
    this.details,
    this.price,
    this.isNew,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'category': category,
      'details': details,
      'price': price,
      'isNew': isNew,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'],
      name: map['name'],
      category: map['category'],
      details: map['details'],
      price: map['price']?.toDouble(),
      isNew: map['isNew']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(image: $image, name: $name, category: $category, details: $details, price: $price, isNew: $isNew)';
  }
}
