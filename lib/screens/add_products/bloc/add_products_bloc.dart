

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/core/cache_sql/cache_sql.dart';
import 'package:products_list/core/models/products_model.dart';


part 'add_products_event.dart';

part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
  AddProductsBloc() : super(AddProductsInitial()) {
    on<AddProductEvent>((addProduct));
  }

  static AddProductsBloc of(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();

  void addProduct(AddProductEvent event, Emitter<AddProductsState> emit) {
    if (formKey.currentState!.validate()) {
      Product product = Product({
        'productName': productName.text,
        'productDescription': productDescription.text,
        'productPrice': productPrice.text,
      });
      emit(AddProductsLoadingState());
      try {
        CacheSQl.createProduct(product);
        FocusScope.of(event.context).requestFocus(FocusNode());
        // productName.clear();
        // productDescription.clear();
        // productPrice.clear();
        emit(AddProductState());
      } catch (error) {
        debugPrint('=====>$error');
      }
    }
  }

  @override
  Future<void> close() {
    productName.dispose();
    productDescription.dispose();
    productPrice.dispose();
    return super.close();
  }
}
