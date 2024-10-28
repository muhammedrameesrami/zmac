import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:product_project/features/product/screens/mobile_screen/mobile_productView_screen.dart';
import 'package:product_project/models/productModel.dart';

import '../core/theme/pallete.dart';
import 'home/screens/home_page.dart';

import 'dart:html' as html;



class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> checkUrlAndNavigate() async {
    // Get the current URL
    var currentUrl = html.window.location.href;
    var uri = Uri.parse(currentUrl);
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.last.isNotEmpty) {
      var productId = uri.pathSegments.last; // Extract the last segment
      final ProductModel productModel=await FirebaseFirestore.instance.collection('products').doc(productId).get().then((value) => ProductModel.fromMap(value.data() ??{}),);
     if(mounted) {
       Navigator.push(context, MaterialPageRoute(builder: (context) =>
           ProductViewScreen(productModel: productModel,),));
       html.window.history.replaceState(null,'Product Page', '/');
     }  } else {
      // Navigate to a default page if no product ID is present in the URL
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
      });
    }
  }


  @override
  void initState() {
    super.initState();
    checkUrlAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.primaryColor,
        body: Center(
            child: Image.asset(AssetConstant.logo)));
  }
}
