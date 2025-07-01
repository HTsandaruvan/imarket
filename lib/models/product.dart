class Product {
  final String id;
  final String name;
  final String category;
  final String country;
  final double minPrice;
  final double maxPrice;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.country,
    required this.minPrice,
    required this.maxPrice,
    required this.imageUrl,
  });

  bool get hasPriceRange => maxPrice > minPrice;
}
