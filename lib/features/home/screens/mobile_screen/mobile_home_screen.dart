
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/features/home/screens/web_screen/web_home_Screen.dart';

import '../../../../core/constant/asset_constant.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../aboutUs/screens/web_screen/web_profile_screen.dart';
import '../../../product/screens/mobile_screen/mobile_product_screen.dart';
import 'mobile_first_screen.dart';
import 'dart:html' as html;

String selectedPage = 'Home';
const tabBarNames = ["HOME", "PRODUCTS", "ABOUT US"];

class MobileHomeScreen extends ConsumerStatefulWidget {
  const MobileHomeScreen({super.key, required this.contextHome});
  final BuildContext contextHome;

  @override
  ConsumerState<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends ConsumerState<MobileHomeScreen> {
  @override
  Widget build(BuildContext contexthome) {
    const tabScreens = [
      MobileFirstScreen(),
      // Product Tab content
      MobileProductScreen(),
      // Profile Tab content
      WebAboutUsScreen(),
    ];
    final isTab = w > h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(child:  Scaffold(
      appBar: AppBar(backgroundColor: Pallete.primaryColor,
        leading: InkWell(onTap: () {
          html.window.location.reload();
        },
            child: SizedBox(
                child:Image.asset(AssetConstant.logo))),
        title: Consumer(
            builder: (context,ref,child) {
              return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      tabBarNames.length,
                          (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            ref.read(taBarIndexProvider.notifier).update(
                                  (state) => index,
                            );
                          },
                          child: AnimatedContainer(
                            height: h * .07,
                            duration: const Duration(milliseconds: 500),
                            child: Center(
                              child: Text(
                                tabBarNames[index],
                                style: GoogleFonts.roboto(
                                    color:ref.watch(taBarIndexProvider) == index
                                        ? Pallete.secondoryColor
                                        : Pallete.greyColor,fontWeight: FontWeight.bold,
                                    letterSpacing: 4,
                                    fontSize: isTab ? h * 0.03 : w * 0.025),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }
        ),elevation: 0,
      ),
      body: Consumer(builder: (context, ref, child) {
        return Column(
          children: [
            // Expanded content area to show tab-specific content
            Expanded(child: tabScreens[ref.watch(taBarIndexProvider)]),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },child: Image.asset(AssetConstant.watsApp),),
    ));

  }
}
