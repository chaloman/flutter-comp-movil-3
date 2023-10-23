import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/Api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  Future<void> addToCart (productId) async {

    Fluttertoast.showToast(msg: "Producto agregado al carrito exitosamente");
  }

  @override
  Widget build(BuildContext context) {

    final productId = widget.productId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Detalle del Producto'),
      ),
      body: FutureBuilder(
        future: Api.get("products/$productId"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No se encontraron datos del producto.'));
          } else {
            final productData = snapshot.data;
            final String name = productData['name'];
            final String description = productData['description'];
            final double price = productData['price'];
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text(
                  '$name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$description',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Precio: \$$price',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToCart(productId);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
