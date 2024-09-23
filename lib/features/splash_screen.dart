import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/core/constant/asset_constant.dart';

import '../core/theme/pallete.dart';
import 'home/screens/home_page.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.primaryColor,
        body: Center(
            child: Image.asset(AssetConstant.logo)));
  }
}
