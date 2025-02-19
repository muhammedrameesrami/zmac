import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:product_project/features/home/screens/web_screen/web_main_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../aboutUs/screens/web_screen/web_profile_screen.dart';
import '../../../product/screens/web_screen/web_product_screen.dart';
import '../mobile_screen/mobile_home_screen.dart';
import 'dart:html' as html;

final taBarIndexProvider = StateProvider(
  (ref) => 0,
);

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key, required this.contextHome});
  final BuildContext contextHome;

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  static const tabScreen = [
    WebMainContainer(),
    WebProductScreen(),
    WebAboutUsScreen(),
  ];
  @override
  Widget build(BuildContext contexthome) {
    final isTab = w > h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(child:     Scaffold(
      appBar: AppBar(backgroundColor: Pallete.primaryColor,
        leading: const SizedBox(),
        title: InkWell(
            onTap: () {
              html.window.location.reload();
            },
            child: SizedBox(
                height: h * 0.2,
                child: Image.asset(
                  AssetConstant.zmacLogo,
                  fit: BoxFit.fill,
                ))),
        actions: [
          Consumer(builder: (context, ref, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                tabBarNames.length,
                    (index) => InkWell(
                  onTap: () {
                    ref.read(taBarIndexProvider.notifier).update(
                          (state) => index,
                    );

                  },
                  child: AnimatedContainer(
                    width: w * 0.25,
                    height: isTab ? h * 0.03 : w * 0.04,
                    duration: const Duration(milliseconds: 500),
                    child: Center(
                      child: Text(
                        tabBarNames[index],
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            color: ref.watch(taBarIndexProvider) == index
                                ? Pallete.secondoryColor
                                : Pallete.greyColor),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],elevation: 0,),
      body: Consumer(builder: (context, ref, child) {
        return Column(
          children: [
           Expanded(
              child: tabScreen[ref.watch(taBarIndexProvider)],
            ),
          ],
        );
      }),

      /// chat with watsapp
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(elevation: 1,
          onPressed: () async {
            const url = "https://wa.me/919995245426";

            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              if(mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                      'WhatsApp is not installed on this device')),
                );
              }
            }
          },
          child: Image.asset(AssetConstant.watsApp,fit: BoxFit.cover,)),
    ));

  }
}
