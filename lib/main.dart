import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/models/cartModel.dart';
import 'package:provider_basics/models/catalogModel.dart';
import 'package:provider_basics/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => CartModel()),
          ),
          Provider(create: ((context) => CatalogModel()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      );
    });
  }
}
