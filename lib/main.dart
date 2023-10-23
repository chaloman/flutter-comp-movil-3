import 'package:flutter/material.dart';
import 'package:umayor_computacion_movil_unidad_3/boot/navigation.boot.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      // home: AppRoutes.home,
      initialRoute: AppRoutes.initialRoute,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
