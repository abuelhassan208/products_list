part of 'manage_products_bloc.dart';

abstract class ManageProductsState {}

class ManageProductsInitial extends ManageProductsState {}

class ManageProductsGetAllProductState extends ManageProductsState {}

class ManageProductsLoadingState extends ManageProductsState {}

class ManageProductsPushToAddProductState extends ManageProductsState {}

class ManageProductsSearchState extends ManageProductsState {}
