import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../common/app_card.dart';

class MarathonBannerCard extends StatelessWidget {
  const MarathonBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      color: AppColors.primaryOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Marathon Event',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Join the challenge and complete your route puzzle.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}