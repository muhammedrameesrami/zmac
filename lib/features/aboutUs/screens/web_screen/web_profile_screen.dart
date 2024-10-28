// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';

class WebAboutUsScreen extends StatelessWidget {
  const WebAboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTab=w>h;
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return Container(
      color: Pallete.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.03),
            Text('LOOKING FORWARD',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

SizedBox(width: w,child: Wrap(alignment: WrapAlignment.center,children: [
  _lookingForwardContainer('Our Mission','dsfskdfslkfldskflskdfslkfdls',AssetConstant.ourMission),
  _lookingForwardContainer('Our Vision','sdfsf',AssetConstant.ourVision  ),
],),),
            SizedBox(height: h * 0.03),
            Text('OUR SUCCESS',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

            /// total content section
            SizedBox(
              width: w,
              child: Wrap(alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _rowContainer(
                      'TOTAL SALES', '120', AssetConstant.mac,Colors.black),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _rowContainer('TOTAL PRODUCTS', '1200',
                      AssetConstant.iPad,Pallete.whiteColor  ),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _rowContainer(
                      'HAPPY CUSTOMER', '120', AssetConstant.groupDevice,Colors.black),
                ],
              ),
            ),

            SizedBox(height: isTab ? w * 0.01 : h * 0.01),
Text('OUR SERVICES',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              width: w,
              child: Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ServiceContainer(
                      'CHIP LEVEL SERVICE', AssetConstant.chip,Colors.white),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _ServiceContainer('CUSTOMER SUPPORT',
                      AssetConstant.customerService,Pallete.whiteColor),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _ServiceContainer(
                      'SALES AND SERVICE', AssetConstant.service,Colors.white),
                ],
              ),
            ),
            SizedBox(height: isTab ? w * 0.01 : h * 0.01),

            Text('CONTACT US',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

            /// footer section
            SizedBox(
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: w * 0.1,
                      endIndent: w * 0.1),
                  SizedBox(height: h * 0.02),
                  Text(
                    'Zmac',
                    style: GoogleFonts.roboto(
                      fontSize: isTab ? h * 0.03 : w * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Pallete.secondoryColor,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(onTap: () async {
                        const url = "https://wa.me/<number> ";
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';

                        }
                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.instagram),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                      SizedBox(width: w * 0.02),
                      InkWell(onTap: () async {
                        const url = "https://wa.me/<number> ";
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';

                        }
                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.watsApp),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                      SizedBox(width: w * 0.02),
                      InkWell(onTap: () async {
                        const url = "https://wa.me/<number> ";
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';

                        }
                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.facebook),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  FittedBox(alignment: Alignment.center, fit: BoxFit.fill,
                    child: InkWell(onTap: () async {
                      const url = "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";

                      if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                      } else {
                      throw 'Could not launch $url';

                      }
                    },
                      child: Text(
                        'Location: Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                        style: GoogleFonts.roboto(
                            fontSize: isTab ? h * 0.02 : w * 0.06,
                            color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                      ),
                    ),
                  ),
                  InkWell(onTap: () async {
                    const url = "https://wa.me/<number> ";
                    if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                    } else {
                    throw 'Could not launch $url';

                    }
                  },
                    child: Text(
                      'Email: zmac@gmail.com',
                      style: GoogleFonts.roboto(
                          fontSize: isTab ? h * 0.02 : w * 0.06,
                          color: Pallete.secondoryColor),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: w * 0.1,
                      endIndent: w * 0.1),
                  SizedBox(height: h * 0.02),
                  Text(
                    '© 2024 Zmac. All rights reserved.',
                    style: GoogleFonts.roboto(
                        fontSize: isTab ? h * 0.02 : w * 0.05,
                        color: Pallete.secondoryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowContainer(String title, String value, String imagePath,Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(
        width: isTab?w*0.3:h*0.6,
        height: h * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(imagePath),
          ),
          // color: Colors.black12,
          borderRadius: BorderRadius.circular(w * 0.02),
          border: Border.all(color: Colors.black38),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: isTab ? h * 0.028 : w * 0.03,
                fontWeight: FontWeight.bold,
                color:color,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: w * 0.03,
                fontWeight: FontWeight.bold,
                color:color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ServiceContainer(String title,  String imagePath,Color color) {
      return Padding(
      padding:EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(width: isTab?w*0.3:h*0.6,
        height: h * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
          // color: Colors.black12,
          borderRadius: BorderRadius.circular(w * 0.02),
          border: Border.all(color: Colors.black38),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: isTab ? h * 0.03 : w * 0.02,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _lookingForwardContainer(String title, String description, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
      child: Container(
        height: h * 0.3,
        width: isTab ? w * 0.4 : w * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(w * 0.02),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            // Text Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(w * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: isTab ? h * 0.03 : w * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Text(
                      description,
                      style: GoogleFonts.roboto(
                        fontSize: isTab ? h * 0.02 : w * 0.04,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Image Section with Full Height
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w * 0.02),
                  bottomRight: Radius.circular(w * 0.02),
                ),
                child: SizedBox(
                  height: double.infinity, // Full height of the parent container
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, // Cover to fill the entire container
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
