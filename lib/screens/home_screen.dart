import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/models/activity.dart';
import 'package:imarket/models/market_stats.dart';
import 'package:imarket/models/product.dart';
import 'package:imarket/widgets/activity_item.dart';
import 'package:imarket/widgets/market_stats_card.dart';
import 'package:imarket/widgets/section_header.dart';
import 'package:imarket/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<MarketStats> stats = [
      MarketStats(title: 'Active Traders', value: '1,245', icon: '👥'),
      MarketStats(title: 'Product Listed', value: '5,678', icon: '📦'),
      MarketStats(title: 'Countries', value: '86', icon: '🌎'),
      MarketStats(title: 'Deals Closed', value: '3,210', icon: '🤝'),
    ];

    final List<Product> products = [
      Product(
        id: '1',
        name: 'Premium Coffee Beans',
        category: 'Agriculture',
        country: 'Brazil',
        minPrice: 3299,
        maxPrice: 3999,
        imageUrl: 'assets/images/Premium Coffee Beans.jpg',
      ),
      Product(
        id: '2',
        name: 'Organic Cotton',
        category: 'Textile',
        country: 'India',
        minPrice: 3200,
        maxPrice: 3800,
        imageUrl: 'assets/images/sample_product-cotton.jpg',
      ),
      Product(
        id: '3',
        name: 'Solar Panels',
        category: 'Energy',
        country: 'China',
        minPrice: 4500,
        maxPrice: 5200,
        imageUrl: 'assets/images/Solar Panels.jpg',
      ),
      Product(
        id: '4',
        name: 'Olive Oil',
        category: 'Food',
        country: 'Spain',
        minPrice: 2800,
        maxPrice: 3500,
        imageUrl: 'assets/images/Olive Oil.jpg',
      ),
    ];

    final List<Activity> activities = [
      Activity(
        id: '1',
        title: 'New trader joined',
        description: 'From Germany',
        timeAgo: '2 hours ago',
        icon: '👋',
      ),
      Activity(
        id: '2',
        title: 'New product listed',
        description: 'Organic Tea from Sri Lanka',
        timeAgo: '5 hours ago',
        icon: '🆕',
      ),
      Activity(
        id: '3',
        title: 'Deal closed',
        description: '100 tons of wheat to Egypt',
        timeAgo: '1 day ago',
        icon: '✅',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            // Header Section - replace with this:
            Container(
              height: 220, // Reduced from 240
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                  stops: const [0.25, 0.77],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ), // Reduced vertical padding
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween, // Better space distribution
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Good morning',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4), // Reduced spacing
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18, // Reduced from 20
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2), // Reduced spacing
                            Text(
                              'ID: IM12345',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11, // Reduced from 12
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: AppColors.accentRed,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 70, // Reduced from 80
                    ),
                  ],
                ),
              ),
            ),

            // Hero Section (Buttons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Post Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.primaryBlue),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    icon: Icon(Icons.search, color: AppColors.primaryBlue),
                    label: Text(
                      'Find Traders',
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                  ),
                ],
              ),
            ),

            // Market Overview Section
            const SectionHeader(title: 'Market Overview'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  return MarketStatsCard(stats: stats[index]);
                },
              ),
            ),

            // Featured Products Section
            const SectionHeader(title: 'Featured Products'),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),

            // Recent Activity Section
            const SectionHeader(title: 'Recent Activity'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ActivityItem(activity: activities[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
