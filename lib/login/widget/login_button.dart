import 'package:flutter/material.dart';
import 'package:notes/theme/app_theme.dart';

class LoginButtonWidget extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  const LoginButtonWidget(
      {Key? key,
      required this.imageUrl,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.color.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              child: Image.asset(
                imageUrl,
                width: 20,
                height: 20,
              ),
            ),
            Container(
              width: 1,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppTheme.color.border,
                    width: 1,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: Text(
                label,
                style: AppTheme.text.primary,
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
