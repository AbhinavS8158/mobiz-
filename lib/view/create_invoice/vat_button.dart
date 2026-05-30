import 'package:flutter/material.dart';

class VatButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const VatButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff4E4BB8)
              : Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}