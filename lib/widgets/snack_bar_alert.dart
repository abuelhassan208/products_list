import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void snackBarAlert(context, String text, {Duration? duration}) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: text,
      // messagePadding: const EdgeInsets.all(10),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.green,
        fontSize: 14
      ),
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(
        Icons.arrow_right_alt_sharp,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
