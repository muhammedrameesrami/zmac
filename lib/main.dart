import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/core/theme/pallete.dart';
import 'package:product_project/features/splash_screen.dart';
import 'package:product_project/models/productModel.dart';

import 'core/constant/variables.dart';
// import 'features/home/screens/home_page.dart';
import 'features/product/screens/mobile_screen/mobile_productView_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<ProductModel> _fetchProductDetailsAndId(String productId) async {
    // Fetch product details from Firestore
    var products = await FirebaseFirestore.instance
        .collection("products")
        .where("productId", isEqualTo: productId)
        .get();

    if (products.docs.isEmpty) {
      throw Exception("Product not found in Firestore");
    } else {
      ProductModel product = ProductModel.fromMap(products.docs.first.data());
      return product;
    }
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'z mac',
      theme: Pallete.theme,
      home:  const SplashScreen(),
      initialRoute: '/',
        onGenerateRoute: (settings) {
          Uri uri = Uri.parse(settings.name!);

          if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'products') {
            String productId = uri.pathSegments.length > 1 ? uri.pathSegments[1] : '';

            if (productId.isNotEmpty) {
              return MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(productId: productId),
              );
            }
          }

          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }

    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  Future<ProductModel?> _fetchProductDetails(String productId) async {
    var products = await FirebaseFirestore.instance
        .collection("products")
        .where("productId", isEqualTo: productId)
        .get();

    if (products.docs.isEmpty) return null;
    return ProductModel.fromMap(products.docs.first.data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProductModel?>(
        future: _fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Product not found'));
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProductViewScreen(productModel: snapshot.data!),
              ),
            );
          });

          return const SizedBox(); // Empty container while navigating
        },
      ),
    );
  }
}
