import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';

class WebAboutUsScreen extends StatelessWidget {
  const WebAboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.03),

            /// total content section
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _rowContainer(
                          'TOTAL SALES', '120', AssetConstant.clients),
                    ),
                    SizedBox(width: w * 0.02), // Small space between containers
                    Expanded(
                      child: _rowContainer('TOTAL PRODUCTS', '1200',
                          AssetConstant.happyCustomer),
                    ),
                    SizedBox(width: w * 0.02), // Small space between containers
                    Expanded(
                      child: _rowContainer(
                          'HAPPY CUSTOMER', '120', AssetConstant.happyCustomer),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: isTab ? w * 0.01 : h * 0.01),

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  Text(
                    'Location: Malappuram',
                    style: GoogleFonts.nunitoSans(
                        fontSize: isTab ? h * 0.02 : w * 0.06,
                        color: Pallete.secondoryColor),
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

  Widget _rowContainer(String title, String value, String imagePath) {
    return Container(
      height: h * 0.3,
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
