
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.textButton, required this.colorButton, required this.onPressed
  });
  final String textButton;
  final Color colorButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            textButton,
            style:const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
