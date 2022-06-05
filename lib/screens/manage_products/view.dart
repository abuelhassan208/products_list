import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/screens/manage_products/bloc/manage_products_bloc.dart';
import 'package:products_list/screens/manage_products/components/manage_products_app_bar.dart';
import 'package:products_list/screens/manage_products/components/manage_products_body.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageProductsBloc()..add(ManageProductsGetAllProducts()),
      child: Scaffold(
        appBar: manageProductBar(),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: ManageProductsBody(),
        ),
      ),
    );
  }
}
