import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_project/core/theme/pallete.dart';

import 'core/constant/variables.dart';
import 'features/home/screens/home_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform
  );
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
      title: 'z mac',
      theme: Pallete.theme,
      home:  HomePage(),
    );
  }
}

