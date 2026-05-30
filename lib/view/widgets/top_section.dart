import 'package:flutter/material.dart';
import 'package:mobiz/utils/appcolors.dart';

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container
        Container(
          height: 330,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(120),
            ),
          ),
        ),

        // Logo Text
        const Positioned(
          top: 50,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mobiz",
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Text(
                "Sales",
                style: TextStyle(
                  fontSize: 38,
                  color: AppColors.white,
                  height: 0.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}