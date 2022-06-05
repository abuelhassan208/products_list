import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/core/cache_sql/cache_sql.dart';
import 'package:products_list/core/models/products_model.dart';

part 'manage_products_event.dart';

part 'manage_products_state.dart';

class ManageProductsBloc
    extends Bloc<ManageProductsEvent, ManageProductsState> {
  ManageProductsBloc() : super(ManageProductsInitial()) {
    on<ManageProductsGetAllProducts>((getAllProduct));
    on<ManageProductsPushToAddProducts>(
        (event, emit) => emit(ManageProductsPushToAddProductState()));
    on<ManageProductsSearchEvent>((search));
  }

  static ManageProductsBloc of(context) => BlocProvider.of(context);
  List<Product> allProducts = [];
  List<Product> list = [];
  String name = '';
  String description = '';
  String price = '';

  Future<void> getAllProduct(
      ManageProductsGetAllProducts event, Emitter<ManageProductsState> emit) {
    emit(ManageProductsLoadingState());
    return CacheSQl.allProducts().then(
      (value) {
        allProducts = value.reversed.map((e) => Product(e)).toList();
        list = allProducts;
        emit(ManageProductsGetAllProductState());
      },
    ).catchError(
      (error) {
        debugPrint('=====>$error');
      },
    );
  }

  void search(
      ManageProductsSearchEvent event, Emitter<ManageProductsState> emit) {
    final products = list.where((element) {
      final productName = element.productName!.toLowerCase();
      final productDescription = element.productDescription!.toLowerCase();
      final productPrice = element.productPrice!.toLowerCase();
      final search = event.searchText.toLowerCase();
      return productName.contains(search) ||
          productDescription.contains(search) ||
          productPrice.contains(search);
    }).toList();
    name = event.searchText;
    description = event.searchText;
    price = event.searchText;
    allProducts = products;
    emit(ManageProductsSearchState());
  }
}
