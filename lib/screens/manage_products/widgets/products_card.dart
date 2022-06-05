import 'package:flutter/material.dart';
import 'package:products_list/core/models/products_model.dart';
import 'package:products_list/core/themes/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productName.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                product.productDescription.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '${product.productPrice} K.D',
                style: const TextStyle(
                    fontSize: 14,
                    color: Themes.buttonColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
