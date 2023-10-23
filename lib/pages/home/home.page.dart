import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Registro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            tooltip: 'Login',
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true, // Para ocultar la contraseña
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para el inicio de sesión
                },
                child: Text('Registrar'),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
