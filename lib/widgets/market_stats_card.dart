import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';
import 'package:imarket/models/market_stats.dart';

class MarketStatsCard extends StatelessWidget {
  final MarketStats stats;

  const MarketStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(12), // Reduced from 15
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Better space distribution
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 36, // Reduced from 40
              height: 36, // Reduced from 40
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  stats.icon,
                  style: const TextStyle(fontSize: 18),
                ), // Reduced from 20
              ),
            ),
            Text(
              stats.value,
              style: const TextStyle(
                fontSize: 16, // Reduced from 18
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              stats.title,
              style: const TextStyle(
                fontSize: 11, // Reduced from 12
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 2, // Allow title to wrap
            ),
          ],
        ),
      ),
    );
  }
}
