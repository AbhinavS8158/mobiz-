
  import 'package:flutter/material.dart';
import 'package:mobiz/utils/appcolors.dart';

Widget dashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.blk.withOpacity(.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: 50,
            ),
      
            const SizedBox(height: 10),
      
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }