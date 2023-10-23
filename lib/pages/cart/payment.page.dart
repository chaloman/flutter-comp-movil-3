import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/products/product.page.dart';

import '../../services/Api.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {


  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Pasarela de pago")
        ),
        body: FutureBuilder(
            future: Api.get("cart/"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Center(child: Text('No se encontraron productos.'));
              } else {
                final products = snapshot.data;
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
