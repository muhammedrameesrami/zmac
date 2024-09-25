import 'package:flutter/material.dart';
import 'package:product_project/features/home/screens/web_screen/web_home_Screen.dart';

import '../../../core/constant/variables.dart';
import 'mobile_screen/mobile_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isTab=w>h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          /// Define your breakpoints for mobile, tablet, and web
          if (constraints.maxWidth < 1000) {
            // Mobile screen layout
            return MobileHomeScreen(contextHome: context,);
          }  else {
            /// Web screen layout
            return WebHomeScreen(contextHome: context,);
          }
        },
      ),
    );
  }
}

