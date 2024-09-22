import 'package:flutter/material.dart';
import 'package:product_project/core/theme/pallete.dart';

import 'core/constant/variables.dart';
import 'features/home/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Page',
      theme: Pallete.theme,
      home:  HomePage(),
    );
  }
}

