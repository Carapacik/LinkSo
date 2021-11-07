import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    this.maxLength,
    this.validator,
    this.onSaved,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
