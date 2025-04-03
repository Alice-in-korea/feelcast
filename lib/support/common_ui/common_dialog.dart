import 'package:feelcast/support/style/style.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final Widget? icon;
  final bool showIcon;
  final String? title;
  final String message;
  final String ctaText;
  final void Function() onTap;
  final String? negativeCtaText;
  final void Function()? negativeCtaOnTap;

  const CommonDialog({
    super.key,
    this.icon,
    this.showIcon = true,
    this.title,
    required this.message,
    required this.ctaText,
    required this.onTap,
    this.negativeCtaText,
    this.negativeCtaOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      backgroundColor: Colors.transparent,
      // insetPadding:
      //     context.isTablet
      //         ? EdgeInsets.symmetric(horizontal: context.screenWidth / 3)
      //         : EdgeInsets.symmetric(horizontal: context.screenWidth / 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: [
            if (showIcon)
              Column(
                children: [
                  icon ?? Icon(Icons.info_outline, color: AppColors.red),
                  const SizedBox(height: 24),
                ],
              ),
            if (title != null)
              Column(
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (negativeCtaText != null)
                  NegativeCtaButton(
                    negativeCtaText: negativeCtaText,
                    negativeCtaOnTap: negativeCtaOnTap,
                  ),
                if (negativeCtaText != null) const SizedBox(width: 8),
                ActionButton(onTap: onTap, title: ctaText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onTap, required this.title});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class NegativeCtaButton extends StatelessWidget {
  final String? negativeCtaText;
  final void Function()? negativeCtaOnTap;

  const NegativeCtaButton({
    super.key,
    required this.negativeCtaText,
    this.negativeCtaOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: negativeCtaOnTap ?? () => Navigator.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF444549),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              negativeCtaText!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
