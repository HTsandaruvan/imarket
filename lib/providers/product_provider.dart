import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  int get totalProducts => _products.length;
  int get totalReviews =>
      _products.fold(0, (sum, product) => sum + product.reviewCount);
  int get totalInquiries =>
      _products.fold(0, (sum, product) => sum + product.inquiryCount);

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock data
      _products = [
        Product(
          id: '1',
          title: 'Premium Coffee Beans - Arabica Grade A',
          description: 'High quality coffee beans from premium farms',
          companyName: 'Global Trade Solution',
          location: 'Delhi, India',
          minPrice: 3480,
          maxPrice: 3750,
          unit: 'ton',
          imageUrl: '/placeholder.svg?height=180&width=400',
          status: ProductStatus.active,
          rating: 4.8,
          reviewCount: 245,
          inquiryCount: 32,
          postedDate: DateTime(2023, 4, 17),
          discountPercentage: 31,
          category: 'Food & Beverages',
          tags: ['coffee', 'arabica', 'premium'],
        ),
        Product(
          id: '2',
          title: 'Premium Coffee Beans - Arabica Grade A',
          description: 'High quality coffee beans from premium farms',
          companyName: 'Global Trade Solution',
          location: 'Delhi, India',
          minPrice: 3480,
          maxPrice: 3750,
          unit: 'ton',
          imageUrl: '/placeholder.svg?height=180&width=400',
          status: ProductStatus.underReview,
          rating: 4.8,
          reviewCount: 156,
          inquiryCount: 28,
          postedDate: DateTime(2023, 4, 15),
          discountPercentage: 31,
          category: 'Food & Beverages',
          tags: ['coffee', 'arabica', 'premium'],
        ),
        Product(
          id: '3',
          title: 'Premium Coffee Beans - Arabica Grade A',
          description: 'High quality coffee beans from premium farms',
          companyName: 'Global Trade Solution',
          location: 'Delhi, India',
          minPrice: 3480,
          maxPrice: 3750,
          unit: 'ton',
          imageUrl: '/placeholder.svg?height=180&width=400',
          status: ProductStatus.active,
          rating: 4.8,
          reviewCount: 189,
          inquiryCount: 45,
          postedDate: DateTime(2023, 4, 12),
          discountPercentage: 31,
          category: 'Food & Beverages',
          tags: ['coffee', 'arabica', 'premium'],
        ),
      ];
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    _products.add(product);
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String productId) async {
    _products.removeWhere((product) => product.id == productId);
    notifyListeners();
  }
}
