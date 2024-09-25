import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';

class WebMainContainer extends StatelessWidget {
  const WebMainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTab=w>h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: isTab?h*0.01:w*0.01,),
          Text('NEW ARRIVAL',style: GoogleFonts.nunitoSans(letterSpacing: 3,
              fontSize: isTab?h*0.04:w*0.04,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: isTab?h*0.01:w*0.01,),
          Container(
            height: isTab ? h * 0.4 : w * 0.4,
            width: double.infinity, // Ensure the container takes full width
            child: CarouselSlider(
              items: [
                Consumer(
                  builder: (context, ref, child) {
                    return buildCarouselItem(AssetConstant.groupDevice);
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return buildCarouselItem(AssetConstant.mac);
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return buildCarouselItem(AssetConstant.iPad);
                  },
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: true,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlay: true,
                aspectRatio: 2.4,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
              ),
            ),
          ),
          // SizedBox(height: isTab?h*0.01:w*0.01), // Add spacing between the carousel and the next section
          SizedBox(
            height: isTab ? h * 0.4 : w * 0.8,
            child: Container(
              // height: double.infinity,
              child: Image.asset(
                AssetConstant.logo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16), // Optional padding for better text layout
            child:  Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to Zmac Apple Solution',style: GoogleFonts.nunitoSans(fontSize: isTab?h*0.03:w*0.03,fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 3),),
                SizedBox(height: isTab?h*0.01:w*0.01,),
                Text(
                  "Welcome to Zmac Apple Solution Your trusted Apple product expert in Asokpuram, Calicut! With over 1000 satisfied customers, we specialize in the sale of high-quality laptops and offer expert chip-level servicing for all Apple devices. Whether you're looking to buy the latest MacBook or need professional repairs, our experienced team is dedicated to delivering the best in technology solutions. Visit us today and experience reliable service that keeps your Apple products performing at their peak.",
                  textAlign: TextAlign.center,style: GoogleFonts.nunitoSans(fontSize: isTab?h*0.02:w*0.03,letterSpacing: 3),
                ),
              ],
            ),
          ),
          SizedBox(height: isTab?h*0.018:w*0.018,),
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
                    fontSize: isTab ? h * 0.04 : w * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Pallete.secondoryColor,letterSpacing: 2
                  ),
                ),
                SizedBox(height: h * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundImage: const AssetImage(AssetConstant.instagram),
                        radius: isTab ? h * 0.02 : w * 0.06),
                    SizedBox(width: w * 0.02),
                    CircleAvatar(
                        backgroundImage: const AssetImage(AssetConstant.watsApp),
                        radius: isTab ? h * 0.02 : w * 0.06),
                    SizedBox(width: w * 0.02),
                    CircleAvatar(
                        backgroundImage: const AssetImage(AssetConstant.facebook),
                        radius: isTab ? h * 0.02 : w * 0.06),
                  ],
                ),
                SizedBox(height: h * 0.02),
                Text(
                  'Location: Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                  style: GoogleFonts.nunitoSans(letterSpacing: 2,
                      fontSize: isTab ? h * 0.02 : w * 0.06,
                      color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                ),
                Text(
                  'Email: zmac@gmail.com',
                  style: GoogleFonts.nunitoSans(letterSpacing: 2,
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
                  style: GoogleFonts.nunitoSans(letterSpacing: 2,
                      fontSize: isTab ? h * 0.02 : w * 0.05,
                      color: Pallete.secondoryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: isTab?h*0.018:w*0.018,),

        ],
      ),
    );
  }

  Widget buildCarouselItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),child: Image.asset(imagePath,fit: BoxFit.contain,),
    );
  }
}
