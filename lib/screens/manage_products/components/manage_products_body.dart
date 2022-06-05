import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/core/models/products_model.dart';
import 'package:products_list/core/navigation/navigation.dart';
import 'package:products_list/screens/add_products/view.dart';
import 'package:products_list/screens/manage_products/bloc/manage_products_bloc.dart';
import 'package:products_list/screens/manage_products/widgets/products_card.dart';
import 'package:products_list/widgets/global_button.dart';
import 'package:products_list/widgets/loading_indicator.dart';
import 'package:products_list/widgets/widget_text_form_field.dart';

class ManageProductsBody extends StatelessWidget {
  const ManageProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageProductsBloc, ManageProductsState>(
      listener: (context, state) {
        if (state is ManageProductsPushToAddProductState) {
          Navigation.push(context, const AddProducts());
        }
      },
      builder: (context, state) {
        ManageProductsBloc bloc = ManageProductsBloc.of(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetTextFormField(
              keyboardType: TextInputType.name,
              hintText: 'Product Search',
              onChanged: (text) {
                bloc.add(ManageProductsSearchEvent(text));
                debugPrint(text);
              },
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).canvasColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            state is ManageProductsLoadingState
                ? const LoadingIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: bloc.allProducts.length,
                      itemBuilder: (context, index) {
                        Product product = bloc.allProducts[index];

                        return ProductCard(
                          product: product,
                        );
                      },
                    ),
                  ),
            GlobalButton(
              text: 'Add Product',
              onPressed: () => bloc.add(ManageProductsPushToAddProducts()),
            ),
          ],
        );
      },
    );
  }
}
