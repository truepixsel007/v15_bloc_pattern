import 'package:flutter/material.dart';

import '../color/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          // color: Colors.green
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
