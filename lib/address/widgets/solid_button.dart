import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onPressed == null,
      child: Opacity(
        opacity: onPressed == null ? 0.2 : 1,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.sizeOf(context).width, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
