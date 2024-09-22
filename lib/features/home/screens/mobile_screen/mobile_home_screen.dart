import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/features/home/screens/mobile_screen/mobie_main_Container.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../product/screens/mobile_screen/mobile_product_screen.dart';
import '../../../profile/screens/mobile-screen/mobile_profile_screen.dart';
import '../../../profile/screens/web_screen/web_profile_screen.dart';
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
              color: Colors.grey[200], // Background color for TabBar container
              child:
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.black12,
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: TabBar(
              //         tabs: [
              //           Tab(text: 'Active'),
              //           Tab(text: 'Finished'),
              //         ],
              //         indicatorSize: TabBarIndicatorSize.tab,
              //         labelColor: Colors.white,
              //         unselectedLabelColor: Colors.white,
              //         indicator: BoxDecoration(
              //           color: const Color(0xff02B558),
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         dividerColor: Colors.transparent,
              //         splashBorderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //     ),
              TabBar(
                onTap: (value) {
                  if(value==0){
                    selectedPage='Home';

                  }else if(value ==1){
                    selectedPage='Product';
                  }else{
                    selectedPage='Profile';
                  }
                  setState(() {

                  });
                },
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Product'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
            // Expanded content area to show tab-specific content
            MobileMainContainer(),
          ],
        ),
      ),
    );
    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Product'),
    //     // leading: IconButton(
    //     //   icon: const Icon(Icons.menu),
    //     //   onPressed: () {
    //     //     Scaffold.of(context).openDrawer();
    //     //   },
    //     // ),
    //   ),
    //   drawer: Drawer(width: w*0.5,backgroundColor: Colors.black,
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         const DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Colors.blue,
    //           ),
    //           child: Text(
    //             'Logo',
    //             style: TextStyle(color: Colors.white, fontSize: 24),
    //           ),
    //         ),
    //         ListTile(
    //           title:  Text('Home',style: GoogleFonts.nunitoSans(color: Pallete.whiteColor),),
    //           onTap: () {
    //             // Update the selected page and close the drawer
    //             setState(() {
    //               selectedPage = 'Home';
    //             });
    //             Navigator.pop(contexthome); // Close the drawer
    //           },
    //         ),
    //         ListTile(
    //           title:  Text('Product',style: GoogleFonts.nunitoSans(color: Pallete.whiteColor),),
    //           onTap: () {
    //             setState(() {
    //               selectedPage = 'Product';
    //             });
    //             Navigator.pop(contexthome);
    //           },
    //         ),
    //         ListTile(
    //           title:  Text('Profile',style: GoogleFonts.nunitoSans(color: Pallete.whiteColor),),
    //           onTap: () {
    //             setState(() {
    //               selectedPage = 'Profile';
    //             });
    //             Navigator.pop(contexthome);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: getPageContent(),
    // );
  }

  // This method returns different content based on the selected page
  // Widget getPageContent() {
  //   if (selectedPage == 'Home') {
  //     return Container(
  //       color: Colors.red,
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: const Center(
  //         child: Text(
  //           'Home Content',
  //           style: TextStyle(fontSize: 24, color: Colors.white),
  //         ),
  //       ),
  //     );
  //   } else if (selectedPage == 'Product') {
  //     return mobile_product_screen();
  //   } else if (selectedPage == 'Profile') {
  //     return Container(
  //       color: Colors.blue,
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: const Center(
  //         child: Text(
  //           'Profile Content',
  //           style: TextStyle(fontSize: 24, color: Colors.white),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return const Center(child: Text('Select a Page'));
  //   }
  // }
}


