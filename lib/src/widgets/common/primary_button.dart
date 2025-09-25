import 'package:flutter/material.dart';

enum ButtonColorVariant { primary, secondary }

class PrimaryButton extends StatelessWidget {
  final String text;
  final ButtonColorVariant variant;
  final VoidCallback onPressed;

  PrimaryButton({
    super.key,
    required this.text,
    this.variant = ButtonColorVariant.primary,
    required this.onPressed,
  });

  Color _getTextColor(ThemeData theme) {
    switch (variant) {
      case ButtonColorVariant.primary:
        return theme.colorScheme.onPrimary;
      case ButtonColorVariant.secondary:
        return theme.colorScheme.onSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: _buildButton(
        context,
        Text(
          text,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: _getTextColor(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, Widget child) {
    switch (variant) {
      case ButtonColorVariant.primary:
        return FilledButton(onPressed: onPressed, child: child);
      case ButtonColorVariant.secondary:
        return FilledButton.tonal(onPressed: onPressed, child: child);
    }
  }
}
