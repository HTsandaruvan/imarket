import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/constants/strings.dart';
import 'package:imarket/models/product.dart';
import 'package:imarket/models/user.dart';
import 'package:imarket/widgets/about_section.dart';
import 'package:imarket/widgets/overview_section.dart';
import 'package:imarket/widgets/profile_action_card.dart';
import 'package:imarket/widgets/profile_header.dart';
import 'package:imarket/widgets/specialties_section.dart';
import 'package:imarket/widgets/notification_toggle.dart'; // Add this import

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;

  final User _user = User(
    id: 'IM12345',
    name: 'John Doe',
    businessName: 'Global Trade Solutions',
    email: 'john.doe@globaltrade.com',
    phone: '+1 (555) 123-4567',
    location: 'New York, USA',
    website: 'www.globaltradesolutions.com',
    about: AppStrings.aboutBusiness,
    specialties: [
      'Agriculture',
      'Textiles',
      'Electronics',
      'Chemicals',
      'Energy',
    ],
    isVerified: true,
    isPremium: true,
    imageUrl: 'assets/images/profile.jpeg',
  );

  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Premium Coffee Beans',
      category: 'Agriculture',
      country: 'Brazil',
      minPrice: 2500,
      maxPrice: 2500,
      imageUrl: 'assets/images/Premium Coffee Beans.jpg',
    ),
    Product(
      id: '2',
      name: 'Organic Cotton',
      category: 'Textile',
      country: 'India',
      minPrice: 3200,
      maxPrice: 3200,
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(user: _user),
            OverviewSection(products: _products),
            const AboutSection(),
            SpecialtiesSection(specialties: _user.specialties),
            _buildActionCards(),
            _buildNotificationSettings(),
            _buildSignOutButton(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'iMarket v1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCards() {
    return Column(
      children: [
        ProfileActionCard(
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.inventory,
          title: 'My Products',
          subtitle: 'Manage your product listings',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.people,
          title: 'My Connections',
          subtitle: 'View your trading partners',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.qr_code,
          title: 'QR Code Integration',
          subtitle: 'Scan to access product info or confirm deliveries',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage notification preferences',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.security,
          title: 'Privacy and Security',
          subtitle: 'Account security settings',
          onTap: () {},
        ),
        ProfileActionCard(
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Get help and contact support',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildNotificationSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notification Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),
              NotificationToggle(
                title: 'Push Notifications',
                value: _pushNotifications,
                onChanged: (value) {
                  setState(() {
                    _pushNotifications = value;
                  });
                },
              ),
              const Divider(),
              NotificationToggle(
                title: 'Email Notifications',
                value: _emailNotifications,
                onChanged: (value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            // Handle sign out
          },
          child: const Text('Sign Out', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
