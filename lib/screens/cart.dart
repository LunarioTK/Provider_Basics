import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/models/cart_model.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: const [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(32),
              child: _CartList(),
            ))
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList();

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>().items;
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cart[index].name),
        );
      },
    );
  }
}
