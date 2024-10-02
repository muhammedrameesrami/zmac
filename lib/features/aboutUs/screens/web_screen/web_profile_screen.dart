import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';

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

            /// total content section
            Container(
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
Text('OUR SERVICES',style: GoogleFonts.nunitoSans(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),
            Container(
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

            Text('CONTACT US',style: GoogleFonts.nunitoSans(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

            /// footer section
            Container(
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
                    style: GoogleFonts.nunitoSans(
                      fontSize: isTab ? h * 0.03 : w * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Pallete.secondoryColor,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(AssetConstant.instagram),
                          radius: isTab ? h * 0.02 : w * 0.06),
                      SizedBox(width: w * 0.02),
                      CircleAvatar(
                          backgroundImage: AssetImage(AssetConstant.watsApp),
                          radius: isTab ? h * 0.02 : w * 0.06),
                      SizedBox(width: w * 0.02),
                      CircleAvatar(
                          backgroundImage: AssetImage(AssetConstant.facebook),
                          radius: isTab ? h * 0.02 : w * 0.06),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  FittedBox(alignment: Alignment.center, fit: BoxFit.fill,
                    child: Text(
                      'Location: Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                      style: GoogleFonts.nunitoSans(
                          fontSize: isTab ? h * 0.02 : w * 0.06,
                          color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                    ),
                  ),
                  Text(
                    'Email: zmac@gmail.com',
                    style: GoogleFonts.nunitoSans(
                        fontSize: isTab ? h * 0.02 : w * 0.06,
                        color: Pallete.secondoryColor),
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
                    style: GoogleFonts.nunitoSans(
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
              style: GoogleFonts.nunitoSans(
                fontSize: isTab ? h * 0.028 : w * 0.03,
                fontWeight: FontWeight.bold,
                color:color,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.nunitoSans(
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
              style: GoogleFonts.nunitoSans(
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

  Widget _diagonalContainer(String title, String value,String imagePath ) {
    return Transform.rotate(
      angle: -0.4,
      child: Container(
        height: h * 0.25,width: isTab?w*0.3:h*0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(w * 0.02),
          border: Border.all(color: Colors.black38),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.nunitoSans(
                fontSize: isTab ? h * 0.03 : w * 0.03,
                fontWeight: FontWeight.bold,
                color: Pallete.secondoryColor,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.nunitoSans(
                fontSize: w * 0.03,
                fontWeight: FontWeight.bold,
                color: Pallete.secondoryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
