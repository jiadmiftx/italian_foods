import 'package:flutter/material.dart';
import 'package:italian_foods/foods/foods_page.dart';

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
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.amber[900], fontSize: 18, fontWeight: FontWeight.bold)
        ),
        primarySwatch: Colors.amber,
      ),
      home: FoodsList(),
      
    );
  }
}

