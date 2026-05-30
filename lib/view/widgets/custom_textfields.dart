import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  bool isPassword = false,
  bool obscureText = false,
  VoidCallback? onTap,
}) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade400,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,

      
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Icon(
            icon,
            size: 32,
            color: Colors.grey.shade700,
          ),
        ),

        
        hintText: hint,

 
        hintStyle: const TextStyle(
          fontSize: 20,
          color: Color(0xff4E4BB8),
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
        ),

        suffixIcon: isPassword
            ? IconButton(
                onPressed: onTap,
                icon: Icon(
                  obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 32,
                  color: Colors.grey.shade700,
                ),
              )
            : null,
      ),
    ),
  );
}
