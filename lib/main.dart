import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_list/core/bloc_observer.dart';
import 'package:products_list/core/themes/theme.dart';
import 'package:products_list/screens/manage_products/view.dart';

void main(){
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ManageProducts(),
      themeMode: ThemeMode.system,
      theme: Themes.light() ,
      darkTheme: Themes.dark(),
    );
  }
}
