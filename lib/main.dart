import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/models/cart_model.dart';
import 'package:provider_basics/models/catalog_model.dart';
import 'package:provider_basics/screens/cart.dart';
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
          ChangeNotifierProvider(create: ((context) => CartModel())),
          Provider(create: ((context) => CatalogModel()))
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': ((context) => const Home()),
            '/cart': (context) => const MyCart()
          },
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}
