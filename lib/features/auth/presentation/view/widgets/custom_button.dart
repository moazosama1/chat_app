import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.textButton,
      required this.colorButton,
      required this.onPressed});
  final String textButton;
  final Color colorButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
                color: theme.colorScheme.surface,
                fontFamily: GoogleFonts.mulish().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
