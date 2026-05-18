import 'package:flutter/material.dart';
import 'package:tictactoe_mobile_app/core/theme/app_colors.dart';
import 'package:tictactoe_mobile_app/core/theme/app_radius.dart';
import 'package:tictactoe_mobile_app/core/theme/app_spacing.dart';
import 'package:tictactoe_mobile_app/core/theme/app_text_styles.dart';

class ReplayButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ReplayButton({required this.onPressed, super.key});

  @override
  State<ReplayButton> createState() => _ReplayButtonState();
}

class _ReplayButtonState extends State<ReplayButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md + 2),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 22,
                color: AppColors.buttonOnPrimary,
              ),
              SizedBox(width: AppSpacing.sm),
              Text('Rejouer', style: AppTextStyles.button),
            ],
          ),
        ),
      ),
    );
  }
}
