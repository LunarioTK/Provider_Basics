import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/models/catalogModel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Basics'),
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(catalog[index]),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
