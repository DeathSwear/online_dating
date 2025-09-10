import 'package:flutter/material.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_text_styles.dart';

class AdButton extends StatefulWidget {
  const AdButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isActive});
  final VoidCallback onPressed;
  final String text;
  final bool isActive;
  @override
  State<AdButton> createState() => _AdButtonState();
}

class _AdButtonState extends State<AdButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: widget.isActive
            ? AppColors.adButtonActiveColor
            : AppColors.adButtonColor,
        child: InkWell(
          onTap: () {
            setState(() {});
            widget.onPressed();
          },
          child: Container(
            height: 50,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: AppTextStyles.adButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
