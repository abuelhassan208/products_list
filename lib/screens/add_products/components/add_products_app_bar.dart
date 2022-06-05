import 'package:flutter/material.dart';
import 'package:products_list/core/navigation/navigation.dart';

AppBar addProductBar(dynamic context) => AppBar(
      title: const Text('Add Product'),
      leading: IconButton(
        onPressed: () {
          Navigation.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
