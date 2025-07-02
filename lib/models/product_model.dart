enum ProductStatus { active, underReview, inactive, rejected }

class Product {
  final String id;
  final String title;
  final String description;
  final String companyName;
  final String location;
  final double minPrice;
  final double maxPrice;
  final String unit;
  final String imageUrl;
  final ProductStatus status;
  final double rating;
  final int reviewCount;
  final int inquiryCount;
  final DateTime postedDate;
  final int discountPercentage;
  final String category;
  final List<String> tags;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.companyName,
    required this.location,
    required this.minPrice,
    required this.maxPrice,
    required this.unit,
    required this.imageUrl,
    required this.status,
    required this.rating,
    required this.reviewCount,
    required this.inquiryCount,
    required this.postedDate,
    this.discountPercentage = 0,
    required this.category,
    this.tags = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      companyName: json['companyName'],
      location: json['location'],
      minPrice: json['minPrice'].toDouble(),
      maxPrice: json['maxPrice'].toDouble(),
      unit: json['unit'],
      imageUrl: json['imageUrl'],
      status: ProductStatus.values.firstWhere(
        (status) => status.toString().split('.').last == json['status'],
      ),
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      inquiryCount: json['inquiryCount'],
      postedDate: DateTime.parse(json['postedDate']),
      discountPercentage: json['discountPercentage'] ?? 0,
      category: json['category'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'companyName': companyName,
      'location': location,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'unit': unit,
      'imageUrl': imageUrl,
      'status': status.toString().split('.').last,
      'rating': rating,
      'reviewCount': reviewCount,
      'inquiryCount': inquiryCount,
      'postedDate': postedDate.toIso8601String(),
      'discountPercentage': discountPercentage,
      'category': category,
      'tags': tags,
    };
  }

  String get priceRange =>
      '\$${minPrice.toStringAsFixed(0)} - \$${maxPrice.toStringAsFixed(0)}/$unit';

  String get formattedDate =>
      '${postedDate.year}/${postedDate.month.toString().padLeft(2, '0')}/${postedDate.day.toString().padLeft(2, '0')}';
}
