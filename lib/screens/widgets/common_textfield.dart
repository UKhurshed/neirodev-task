import 'package:flutter/material.dart';
import 'package:neirodev/core/extensions/screen_size.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.appHeight * 50.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.fromLTRB(context.appWidth * 10.w, 0, 0, 0),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}