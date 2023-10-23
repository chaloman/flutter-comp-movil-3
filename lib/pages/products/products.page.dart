import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/products/product.page.dart';

import '../../services/Api.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Productos"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Carrito',
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            ),
          ],
        ),
        body: FutureBuilder(
            future: Api.get("products"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Center(child: Text('No se encontraron productos.'));
              } else {
                final products = snapshot.data;
                print(products);

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index]["name"]),
                      subtitle: Text('\$${products[index]["price"]}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductPage(productId: products[index]["id"]), // Reemplaza MyPage con tu página deseada
                            ),
                          );
                        },
                        child: const Icon(Icons.visibility),
                      ),
                    );
                  },
                );
              }
            }
        )
    );
  }
}
