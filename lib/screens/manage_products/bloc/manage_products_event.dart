part of 'manage_products_bloc.dart';

abstract class ManageProductsEvent {}
class ManageProductsGetAllProducts extends ManageProductsEvent{}
class ManageProductsPushToAddProducts extends ManageProductsEvent{}
class ManageProductsSearchEvent extends ManageProductsEvent{
  String searchText;

  ManageProductsSearchEvent(this.searchText);
}
