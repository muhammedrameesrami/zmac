import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/features/home/screens/web_screen/web_main_container.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../aboutUs/screens/web_screen/web_profile_screen.dart';
import '../../../product/screens/web_screen/web_product_screen.dart';
import '../mobile_screen/mobile_home_screen.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key, required this.contextHome});
  final BuildContext contextHome;

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext contexthome) {
    return DefaultTabController(
      initialIndex: selectedPage == 'Home'
          ? 0
          : selectedPage == 'Product'
              ? 1
              : 2,
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // TabBar at the top
            Container(
              color:
                  Pallete.primaryColor, // Background color for TabBar container
              child: TabBar(
                onTap: (value) {
                  if (value == 0) {
                    selectedPage = 'Home';
                  } else if (value == 1) {
                    selectedPage = 'Product';
                  } else {
                    selectedPage = 'About Us';
                  }
                  setState(() {});
                },
                indicatorColor: Pallete.secondoryColor,
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Product'),
                  Tab(text: 'About Us'),
                ],
              ),
            ),
            // Expanded content area to show tab-specific content
            Expanded(
              child: TabBarView(
                children: [
                  // Home Tab content - Red container
                  WebMainContainer(),
                  // Product Tab content
                  const WebProductScreen(),
                  // Profile Tab content
                  const WebAboutUsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
