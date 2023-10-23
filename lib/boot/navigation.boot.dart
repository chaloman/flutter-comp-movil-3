import 'package:flutter/material.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/auth/login.page.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/auth/register.page.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/cart/cart.page.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/cart/payment.page.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/home/home.page.dart';
import 'package:umayor_computacion_movil_unidad_3/pages/products/products.page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    "/login": (ctx) => const LoginPage(),
    "/register": (ctx) => const RegisterPage(),

    "/products": (ctx) => const ProductsPage(),
    "/cart": (ctx) => const CartPage(),
    "/cart/payment": (ctx) => const PaymentPage(),

    "/": (ctx) => const HomePage()
  };

  static const initialRoute  = "/login";
  static const home = LoginPage();

}

