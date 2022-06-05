
import 'package:flutter/material.dart';
import 'package:products_list/core/themes/theme.dart';

class GlobalButton extends StatelessWidget {
  final Color? cusColor;
  final String text;
  final void Function() onPressed;

  const GlobalButton(
      {Key? key, required this.text, required this.onPressed, this.cusColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: cusColor ?? Themes.buttonColor,
      height: MediaQuery.of(context).size.height / 12,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 10,
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
