import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/features/home/screens/mobile_screen/mobie_main_Container.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../product/screens/mobile_screen/mobile_product_screen.dart';

String selectedPage = 'Home';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key,required this.contextHome});
  final BuildContext contextHome;

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {

  @override
  Widget build(BuildContext contexthome) {
    return  DefaultTabController(
      initialIndex:selectedPage == 'Home'?0:selectedPage == 'Product'?1:2,
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // TabBar at the top
            Container(
              color: Pallete.primaryColor, // Background color for TabBar container
              child:
              TabBar(
                onTap: (value) {
                  if(value==0){
                    selectedPage='Home';

                  }else if(value ==1){
                    selectedPage='Product';
                  }else{
                    selectedPage='About Us';
                  }
                  setState(() {

                  });
                },
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Product'),
                  Tab(text: 'About Us'),
                ],
              ),
            ),
            // Expanded content area to show tab-specific content
            MobileMainContainer(),
          ],
        ),
      ),
    );
  }
}


