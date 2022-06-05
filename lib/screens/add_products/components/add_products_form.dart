import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/core/navigation/navigation.dart';
import 'package:products_list/screens/add_products/bloc/add_products_bloc.dart';
import 'package:products_list/screens/manage_products/view.dart';
import 'package:products_list/widgets/snack_bar_alert.dart';
import 'package:products_list/widgets/widget_text_form_field.dart';

class AppProductsForm extends StatelessWidget {
  const AppProductsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsBloc, AddProductsState>(
      listener: (context, state) {
        if (state is AddProductState) {
          Navigation.pushAndRemoveUntil(context, const ManageProducts());
          snackBarAlert(context,'\u2713 Product was added successfully');
        }
      },
      builder: (context, state) {
        AddProductsBloc bloc = AddProductsBloc.of(context);
        return Form(
          key: bloc.formKey,
          child: Column(
            children: productsForm(bloc, context)
                .map((value) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: value,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}

List<Widget> productsForm(AddProductsBloc bloc, context) => [
      WidgetTextFormField(
        keyboardType: TextInputType.name,
        hintText: 'Product Name',
        controller: bloc.productName,
      ),
      WidgetTextFormField(
        keyboardType: TextInputType.text,
        hintText: 'Product Description',
        controller: bloc.productDescription,
      ),
      WidgetTextFormField(
        keyboardType: TextInputType.number,
        hintText: 'Product Price',
        controller: bloc.productPrice,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'K.D',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    ];
