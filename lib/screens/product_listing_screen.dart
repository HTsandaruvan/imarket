import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/models/product.dart';
import 'package:imarket/widgets/product_card.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  double _minPrice = 0;
  double _maxPrice = 10000;
  bool _showFilters = false;

  // Sample categories
  final List<String> categories = [
    'All',
    'Agriculture',
    'Textile',
    'Energy',
    'Food',
    'Electronics',
    'Chemicals',
  ];

  // Sample products
  final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Premium Coffee Beans',
      category: 'Agriculture',
      country: 'Brazil',
      minPrice: 3299,
      maxPrice: 3499,
      imageUrl: 'assets/images/Premium Coffee Beans.jpg',
    ),
    Product(
      id: '2',
      name: 'Organic Cotton',
      category: 'Textile',
      country: 'India',
      minPrice: 2799,
      maxPrice: 3199,
      imageUrl: 'assets/images/sample_product-cotton.jpg',
    ),
    Product(
      id: '3',
      name: 'Solar Panels',
      category: 'Energy',
      country: 'China',
      minPrice: 4500,
      maxPrice: 4500,
      imageUrl: 'assets/images/Solar Panels.jpg',
    ),
    Product(
      id: '4',
      name: 'Olive Oil',
      category: 'Food',
      country: 'Spain',
      minPrice: 2800,
      maxPrice: 3100,
      imageUrl: 'assets/images/Olive Oil.jpg',
    ),
    Product(
      id: '5',
      name: 'Smartphones',
      category: 'Electronics',
      country: 'South Korea',
      minPrice: 15000,
      maxPrice: 18000,
      imageUrl: 'assets/images/Smartphones.jfif',
    ),
    Product(
      id: '6',
      name: 'Fertilizers',
      category: 'Chemicals',
      country: 'Germany',
      minPrice: 1200,
      maxPrice: 1500,
      imageUrl: 'assets/images/Fertilizer.jfif',
    ),
  ];

  List<Product> get filteredProducts {
    return allProducts.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(
        _searchController.text.toLowerCase(),
      );
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesPrice =
          product.minPrice >= _minPrice && product.maxPrice <= _maxPrice;

      return matchesSearch && matchesCategory && matchesPrice;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        )
                        : null,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),

          // Categories Horizontal List
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = selected ? category : 'All';
                      });
                    },
                    selectedColor: AppColors.primaryBlue,
                    labelStyle: TextStyle(
                      color:
                          _selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),

          // Filters Panel
          if (_showFilters)
            Card(
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price Range',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    RangeSlider(
                      values: RangeValues(_minPrice, _maxPrice),
                      min: 0,
                      max: 20000,
                      divisions: 20,
                      labels: RangeLabels(
                        'Rs. ${_minPrice.toInt()}',
                        'Rs. ${_maxPrice.toInt()}',
                      ),
                      onChanged: (values) {
                        setState(() {
                          _minPrice = values.start;
                          _maxPrice = values.end;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs. ${_minPrice.toInt()}'),
                        Text('Rs. ${_maxPrice.toInt()}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Products Grid
          Expanded(
            child:
                filteredProducts.isEmpty
                    ? const Center(child: Text('No products found'))
                    : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: filteredProducts[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
