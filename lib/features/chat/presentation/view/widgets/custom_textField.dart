
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key , this.onSubmitted , required this.controller , this.onPressed});
  void Function(String)? onSubmitted;
  void Function()? onPressed;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        onSubmitted:onSubmitted,
        style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: "Send messages",
          hintStyle:const TextStyle(
            color: Colors.black38,
            fontSize: 20
          ),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.send,
                size: 30,
              )),
          border: buildOutlineInputBorder(),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black54, width: 2),
    );
  }
}
