import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'product_details_screen.dart';
import '../../models/product_model.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../main_navigation_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isGridView = false;

  // Mock product data
  final List<Product> _mockProducts = [
    Product(
      id: '1',
      title: 'Premium Coffee Beans - Arabica Grade A',
      description:
          'High-quality coffee beans sourced from the finest farms. Our Arabica Grade A coffee beans are carefully selected and processed to ensure exceptional flavor and aroma. Perfect for coffee enthusiasts and commercial use. These beans undergo rigorous quality control and are certified organic. Ideal for espresso, drip coffee, and other brewing methods.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 3480,
      maxPrice: 3750,
      unit: 'ton',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.JC-XoAh3uCPQbkncZ6spAQHaEo&pid=Api&P=0&h=180',
      status: ProductStatus.active,
      rating: 4.8,
      reviewCount: 245,
      inquiryCount: 32,
      postedDate: DateTime(2023, 4, 17),
      discountPercentage: 31,
      category: 'Food & Beverages',
      tags: ['coffee', 'arabica', 'premium', 'organic'],
    ),
    Product(
      id: '2',
      title: 'Premium Coffee Beans - Arabica Grade A',
      description:
          'High-quality coffee beans sourced from the finest farms. Our Arabica Grade A coffee beans are carefully selected and processed to ensure exceptional flavor and aroma. Perfect for coffee enthusiasts and commercial use. These beans undergo rigorous quality control and are certified organic.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 3480,
      maxPrice: 3750,
      unit: 'ton',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.JC-XoAh3uCPQbkncZ6spAQHaEo&pid=Api&P=0&h=180',
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
      description:
          'High-quality coffee beans sourced from the finest farms. Our Arabica Grade A coffee beans are carefully selected and processed to ensure exceptional flavor and aroma. Perfect for coffee enthusiasts and commercial use. These beans undergo rigorous quality control and are certified organic.',
      companyName: 'Global Trade Solution',
      location: 'Delhi, India',
      minPrice: 3480,
      maxPrice: 3750,
      unit: 'ton',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.JC-XoAh3uCPQbkncZ6spAQHaEo&pid=Api&P=0&h=180',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle download/export
              _showExportDialog();
            },
            icon: const Icon(Icons.download_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              // Handle filter
              _showFilterDialog();
            },
            icon: const Icon(Icons.filter_list, color: Colors.grey),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Total\nProducts',
                    value: _mockProducts.length.toString(),
                    color: Colors.blue[50]!,
                    textColor: Colors.blue[700]!,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'Total\nReviews',
                    value: _mockProducts
                        .fold(0, (sum, product) => sum + product.reviewCount)
                        .toString(),
                    color: Colors.green[50]!,
                    textColor: Colors.green[700]!,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'Total\nInquiries',
                    value: _mockProducts
                        .fold(0, (sum, product) => sum + product.inquiryCount)
                        .toString(),
                    color: Colors.orange[50]!,
                    textColor: Colors.orange[700]!,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Product Listings Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Product Listings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.95,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: const AddProductScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add product'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6CF7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Product List
            _isGridView ? _buildGridView() : _buildListView(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 2, // Products tab
        onTap: (index) {
          if (index != 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainNavigationScreen(initialIndex: index),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _mockProducts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildProductCard(index),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: _mockProducts.length,
      itemBuilder: (context, index) {
        return _buildProductCard(index, isGrid: true);
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(0.8),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index, {bool isGrid = false}) {
    final product = _mockProducts[index];
    final List<String> statuses = ['Active', 'Under Review', 'Active'];
    final List<Color> statusColors = [
      Colors.green,
      Colors.orange,
      Colors.green,
    ];

    return GestureDetector(
      onTap: () {
        // Navigate to product details
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
                    height: isGrid ? 120 : 180,
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
                        '${product.discountPercentage}% OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isGrid ? 8 : 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                // Status Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: statusColors[index],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: isGrid ? 12 : 16,
                    ),
                  ),
                ),
              ],
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.all(isGrid ? 12 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: isGrid ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: isGrid ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: isGrid ? 4 : 8),

                  // Company Name
                  Text(
                    product.companyName,
                    style: TextStyle(
                      fontSize: isGrid ? 12 : 14,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: isGrid ? 4 : 8),

                  // Location and Date
                  if (!isGrid) ...[
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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Price and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Expanded(
                        child: Text(
                          product.priceRange,
                          style: TextStyle(
                            fontSize: isGrid ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4A6CF7),
                          ),
                        ),
                      ),

                      // Rating and Actions
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: isGrid ? 14 : 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            product.rating.toString(),
                            style: TextStyle(
                              fontSize: isGrid ? 12 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (!isGrid) ...[
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => _showProductOptions(product),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
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

  void _showProductOptions(Product product) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Product'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to edit product
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Duplicate Product'),
              onTap: () {
                Navigator.pop(context);
                // Handle duplicate
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility_off),
              title: const Text('Hide Product'),
              onTap: () {
                Navigator.pop(context);
                // Handle hide
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(
                'Delete Product',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(product);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete "${product.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _mockProducts.removeWhere((p) => p.id == product.id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Product deleted successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Products'),
        content: const Text('Choose export format:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle CSV export
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exporting to CSV...')),
              );
            },
            child: const Text('CSV'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle PDF export
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exporting to PDF...')),
              );
            },
            child: const Text('PDF'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Products'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All Products'),
              leading: Radio(
                value: 'all',
                groupValue: 'all',
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Active'),
              leading: Radio(
                value: 'active',
                groupValue: 'all',
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Under Review'),
              leading: Radio(
                value: 'review',
                groupValue: 'all',
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Inactive'),
              leading: Radio(
                value: 'inactive',
                groupValue: 'all',
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Apply filter
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
