part of 'add_products_bloc.dart';

abstract class AddProductsState {}

class AddProductsInitial extends AddProductsState {}

class AddProductsLoadingState extends AddProductsState {}

class AddProductState extends AddProductsState {}

class AddProductErrorState extends AddProductsState {}
