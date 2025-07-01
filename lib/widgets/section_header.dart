import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/screens/product_listing_screen.dart';
import 'package:imarket/screens/user_profile_screen.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeAll;

  const SectionHeader({super.key, required this.title, this.showSeeAll = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          if (showSeeAll)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ),
                );
              },
              child: Text(
                'See all',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ),
        ],
      ),
    );
  }
}
