import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../products/product_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  List<Product> _filteredProducts = [];
  bool _showFilters = false;

  // Mock product data for search
  final List<Product> _allProducts = [
    Product(
      id: '1',
      title: 'Premium Coffee Beans - Arabica Grade A',
      description:
          'High-quality coffee beans sourced from the finest farms. Our Arabica Grade A coffee beans are carefully selected and processed to ensure exceptional flavor and aroma.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 5460,
      maxPrice: 5730,
      unit: 'ton',
      imageUrl:
          'https://tse1.mm.bing.net/th?id=OIP.SxlOEN3Td-AOF8a7cdO9PQHaE7&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.8,
      reviewCount: 245,
      inquiryCount: 32,
      postedDate: DateTime(2023, 4, 17),
      discountPercentage: 31,
      category: 'Agriculture',
      tags: ['coffee', 'arabica', 'premium', 'organic'],
    ),
    Product(
      id: '2',
      title: 'Beans - Arabica Grade A',
      description:
          'High-quality coffee beans sourced from the finest farms. Perfect for coffee enthusiasts and commercial use.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 5460,
      maxPrice: 5730,
      unit: 'ton',
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.VGBB-9LUeXjjS9KBv29a_AHaEo&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.8,
      reviewCount: 156,
      inquiryCount: 28,
      postedDate: DateTime(2023, 4, 15),
      discountPercentage: 31,
      category: 'Agriculture',
      tags: ['coffee', 'arabica', 'premium'],
    ),
    Product(
      id: '3',
      title: 'Premium Mobile Phones',
      description:
          'High-quality coffee beans sourced from the finest farms. These beans undergo rigorous quality control.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 5460,
      maxPrice: 5730,
      unit: 'ton',
      imageUrl:
          'https://tse2.mm.bing.net/th?id=OIP.-YxSyoGd1YirX-HXT7O3NAHaDt&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.8,
      reviewCount: 189,
      inquiryCount: 45,
      postedDate: DateTime(2023, 4, 12),
      discountPercentage: 31,
      category: 'Electronics',
      tags: ['coffee', 'arabica', 'premium'],
    ),
    Product(
      id: '4',
      title: 'Tea',
      description:
          'Certified organic coffee beans with exceptional quality and taste.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 5460,
      maxPrice: 5730,
      unit: 'ton',
      imageUrl:
          'https://tse1.mm.bing.net/th?id=OIP.hoA1z2AZ4znyMoN7h42D3QHaE8&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.8,
      reviewCount: 203,
      inquiryCount: 67,
      postedDate: DateTime(2023, 4, 10),
      discountPercentage: 31,
      category: 'Agriculture',
      tags: ['coffee', 'arabica', 'premium', 'organic'],
    ),
    Product(
      id: '5',
      title: 'Industrial Electronics Components',
      description:
          'High-quality electronic components for industrial applications.',
      companyName: 'Tech Solutions Ltd',
      location: 'Mumbai, India',
      minPrice: 2500,
      maxPrice: 3200,
      unit: 'piece',
      imageUrl:
          'https://tse2.mm.bing.net/th?id=OIP.HXI_b7CNjaV5jN5oAIB6vAHaDq&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.5,
      reviewCount: 89,
      inquiryCount: 23,
      postedDate: DateTime(2023, 4, 8),
      discountPercentage: 15,
      category: 'Electronics',
      tags: ['electronics', 'industrial', 'components'],
    ),
    Product(
      id: '6',
      title: 'Cotton Textile Fabrics',
      description: 'Premium quality cotton fabrics for textile manufacturing.',
      companyName: 'Textile Exports Inc',
      location: 'Chennai, India',
      minPrice: 1200,
      maxPrice: 1800,
      unit: 'meter',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.JYkHcwRs9E6NiSxUBTYW8QHaE9&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.6,
      reviewCount: 134,
      inquiryCount: 56,
      postedDate: DateTime(2023, 4, 5),
      discountPercentage: 20,
      category: 'Textiles',
      tags: ['cotton', 'textile', 'fabric'],
    ),
  ];

  final List<String> _categories = [
    'All',
    'Agriculture',
    'Electronics',
    'Textiles',
  ];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _filterProducts() {
    setState(() {
      List<Product> filtered = _allProducts;

      // Filter by category
      if (_selectedCategory != 'All') {
        filtered = filtered
            .where((product) => product.category == _selectedCategory)
            .toList();
      }

      // Filter by search query
      if (_searchController.text.isNotEmpty) {
        final query = _searchController.text.toLowerCase();
        filtered = filtered
            .where(
              (product) =>
                  product.title.toLowerCase().contains(query) ||
                  product.description.toLowerCase().contains(query) ||
                  product.companyName.toLowerCase().contains(query) ||
                  product.category.toLowerCase().contains(query) ||
                  product.tags.any((tag) => tag.toLowerCase().contains(query)),
            )
            .toList();
      }

      _filteredProducts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => _filterProducts(),
                      decoration: const InputDecoration(
                        hintText: 'Search Products',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showFilters = !_showFilters;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _showFilters
                          ? const Color(0xFF4A6CF7)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: _showFilters ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Category Filters
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _buildCategoryChip(category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          // Advanced Filters (if shown)
          if (_showFilters)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Advanced Filters',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildFilterChip('Verified Only', false),
                      _buildFilterChip('Discounted', false),
                      _buildFilterChip('High Rated', false),
                      _buildFilterChip('Recent', false),
                    ],
                  ),
                ],
              ),
            ),

          // Results Count
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              '${_filteredProducts.length} Results found',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Products List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildProductCard(_filteredProducts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
        _filterProducts();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle filter selection
        setState(() {
          // Toggle filter logic here
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4A6CF7).withOpacity(0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Badges
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Discount Badge
                if (product.discountPercentage > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${product.discountPercentage}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                // Verified Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Company Name
                  Text(
                    product.companyName,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 8),

                  // Location and Date
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Posted ${product.formattedDate}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Price and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        product.priceRange,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A6CF7),
                        ),
                      ),

                      // Rating
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            product.rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
