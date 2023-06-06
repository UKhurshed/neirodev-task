import 'package:flutter/material.dart';
import 'package:neirodev/core/extensions/screen_size.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.appHeight * 50.h,
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.fromLTRB(context.appWidth * 10.w, 0, 0, 0),
            hintText: 'Введите имя',
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