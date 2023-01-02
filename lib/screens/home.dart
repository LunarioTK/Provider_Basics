import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/models/cart_model.dart';
import 'package:provider_basics/models/catalog_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //var catalog = Provider.of<CatalogModel>(context, listen: false).items;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() => Navigator.pushNamed(context, '/cart')),
            icon: const Icon(Icons.wallet_membership),
          )
        ],
        title: const Text('Provider Basics'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _MyCatalog(index: index);
        },
      ),
    );
  }
}

class _AddCart extends StatelessWidget {
  final Item item;
  const _AddCart({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return IconButton(
      icon: isInCart ? const Icon(Icons.check) : const Icon(Icons.add),
      onPressed: () {
        isInCart
            ? null
            : () {
                var cart = context.read<CartModel>();
                cart.add(item);
              };
      },
    );
  }
}

class _MyCatalog extends StatelessWidget {
  final int index;
  const _MyCatalog({required this.index});

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    return ListTile(
      title: Text(item.name),
      trailing: _AddCart(item: item),
    );
  }
}
