import 'package:flutter/material.dart';

class WidgetTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  const WidgetTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1),
          style: Theme.of(context).textTheme.bodyText1,
          validator: (value) {
            if (value.toString().isEmpty || value == null) {
              return 'empty Field';
            } else if (value.length < 3) {
              return 'this field must be at least 3 Values';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
