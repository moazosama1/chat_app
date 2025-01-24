import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
   CustomTextFromField({super.key, required this.hintText , this.onChange , this.validate});
  final String hintText;
  Function(String)? onChange;
   String? Function(String?)? validate;
   @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      onChanged: onChange,
      style: const TextStyle(color: Colors.black87, fontSize: 25),
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          errorBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent));
  }
}
