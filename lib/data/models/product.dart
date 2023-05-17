class Product {
  final String name;
  final String alias;
  final int price;
  final String about;
  final List<String> characteristics;
  final List<String> imgUrls;

  const Product({
    required this.name,
    required this.alias,
    required this.price,
    required this.about,
    required this.characteristics,
    required this.imgUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'alias': alias,
      'price': price,
      'about': about,
      'characteristics': characteristics,
      'imgUrls': imgUrls,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      alias: map['alias'] ?? '',
      price: map['price']?.toInt() ?? 0,
      about: map['about'] ?? '',
      characteristics: List<String>.from(map['characteristics']),
      imgUrls: List<String>.from(map['imgUrls']),
    );
  }

  @override
  String toString() {
    return 'Product(name: $name, alias: $alias, price: $price, about: $about, characteristics: $characteristics, imgUrls: $imgUrls)';
  }
}
