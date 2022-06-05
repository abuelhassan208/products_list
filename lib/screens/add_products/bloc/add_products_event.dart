part of 'add_products_bloc.dart';

@immutable
abstract class AddProductsEvent {}

class AddProductEvent extends AddProductsEvent {
  final dynamic context;

  AddProductEvent(this.context);
}
