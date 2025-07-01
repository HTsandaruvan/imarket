import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/models/product.dart';
import 'package:imarket/widgets/product_card.dart';

class OverviewSection extends StatelessWidget {
  final List<Product> products;

  const OverviewSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12), // Reduced from 16
          // Stats Cards - Fixed height and padding
          SizedBox(
            height: 90, // Reduced from 100
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStatCard(Icons.inventory, 'Products', '24'),
                _buildStatCard(Icons.people, 'Connections', '156'),
                _buildStatCard(Icons.star, 'Rating', '4.8'),
                _buildStatCard(Icons.handshake, 'Deals', '42'),
              ],
            ),
          ),
          const SizedBox(height: 0), // Reduced from 24

          const Text(
            'My Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12), // Reduced from 16
          // Products List - Fixed height
          SizedBox(
            height: 170, // Reduced from 180
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ), // Reduced from 16
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value) {
    return Container(
      width: 110, // Reduced from 120
      margin: const EdgeInsets.only(right: 12), // Reduced from 16
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Reduced from 12
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Added to prevent overflow
          children: [
            Icon(
              icon,
              size: 18,
              color: AppColors.primaryBlue,
            ), // Reduced from 30
            const SizedBox(height: 6), // Reduced from 8
            Text(
              value,
              style: const TextStyle(
                fontSize: 16, // Reduced from 18
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11, // Reduced from 12
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
