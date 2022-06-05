import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/screens/add_products/bloc/add_products_bloc.dart';
import 'package:products_list/screens/add_products/components/add_products_app_bar.dart';
import 'package:products_list/screens/add_products/components/add_products_form.dart';
import 'package:products_list/widgets/global_button.dart';
import 'package:products_list/widgets/loading_indicator.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsBloc(),
      child: Scaffold(
        appBar: addProductBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppProductsForm(),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<AddProductsBloc, AddProductsState>(
                  builder: (context, state) {
                    AddProductsBloc bloc = AddProductsBloc.of(context);
                    return state is AddProductsLoadingState
                        ? const LoadingIndicator()
                        : GlobalButton(
                            onPressed: () => bloc.add(AddProductEvent(context)),
                            text: 'Submit',
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
