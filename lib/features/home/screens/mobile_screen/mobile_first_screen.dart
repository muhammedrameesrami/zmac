import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/asset_constant.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import 'package:url_launcher/url_launcher.dart';


class MobileFirstScreen extends StatelessWidget {
  const MobileFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList=[AssetConstant.mac,AssetConstant.iPad,AssetConstant.groupDevice];
    final isTab=w>h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return     Padding(
      padding: EdgeInsets.symmetric(horizontal: isTab?w*.04:w*.02,vertical: isTab?h*.04:h*.02),
      child: SizedBox(
        width: w,
        height: h,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NEW ARRIVAL',
                style: GoogleFonts.nunitoSans(
                    fontSize: isTab ? h * 0.04 : w * 0.04,
                    color: Colors.black,letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: isTab?h*0.01:w*0.01,),
              SizedBox(
                 height: isTab ? h * 0.4 : w * 0.5,
                width: w, // Ensure the container takes full width
                child: CarouselSlider.builder(itemCount: 3,itemBuilder: (context, index, realIndex) {
                  return Consumer(
                    builder: (context, ref, child) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   fit: BoxFit.cover, // Ensures the image covers the entire container
                          //   image: AssetImage(imagePath),
                          // ),
                          borderRadius: BorderRadius.circular(30),
                        ),child: Image.asset(imageList[index],fit: BoxFit.contain,),
                      );
                    },
                  );
                },

                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    autoPlayAnimationDuration:
                    Duration(milliseconds: 800),
                    autoPlay: true,
                    aspectRatio: 2.3,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              SizedBox(
                  height: isTab?w*0.5:h/w*120,
                  width: w,
                  child: Image.asset(
                    AssetConstant.logo,
                    fit: BoxFit.fill,
                  )),
              Center(child: Text('Welcome to Zmac Apple Solution',style: GoogleFonts.nunitoSans(fontSize: isTab?w*0.02:h*0.02,color: Colors.black,letterSpacing: 3),),),
              SizedBox(
                  width: w,
                  child: Center(
                      child: Text(
                          "Welcome to Zmac Apple Solution Your trusted Apple product expert in Asokpuram, Calicut! With over 1000 satisfied customers, we specialize in the sale of high-quality laptops and offer expert chip-level servicing for all Apple devices. Whether you're looking to buy the latest MacBook or need professional repairs, our experienced team is dedicated to delivering the best in technology solutions. Visit us today and experience reliable service that keeps your Apple products performing at their peak.",style:
                        GoogleFonts.nunitoSans(fontSize: isTab ? h * 0.02 : w * 0.04,color: Colors.black,letterSpacing: 3),))),

              // SizedBox(height: isTab?h*0.018:w*0.018,),

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
                      style: GoogleFonts.nunitoSans(
                        fontSize: isTab ? h * 0.03 : w * 0.06,
                        fontWeight: FontWeight.bold,letterSpacing: 3,
                        color: Pallete.secondoryColor,
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundImage:
                            AssetImage(AssetConstant.instagram),
                            radius: isTab ? h * 0.02 : w * 0.05),
                        SizedBox(width: w * 0.02),
                        CircleAvatar(
                            backgroundImage:
                            AssetImage(AssetConstant.watsApp),
                            radius: isTab ? h * 0.02 : w * 0.05),
                        SizedBox(width: w * 0.02),
                        CircleAvatar(
                            backgroundImage:
                            AssetImage(AssetConstant.facebook),
                            radius: isTab ? h * 0.02 : w * 0.05),
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Center(
                      child: InkWell(onTap: () async {
                        const url = 'https://maps.app.goo.gl/ZLqTPrmiXoZEagst7';
                        if (await canLaunch(url)) {
                        await launch(url);
                        } else {
                        throw 'Could not launch $url';
                        }
                      },
                        child: Text(
                          'Location : Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                          style: GoogleFonts.nunitoSans(letterSpacing: 2,
                              fontSize: isTab ? h * 0.02 : w * 0.04,
                              color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    SelectableText(
                      'Email: zmac@gmail.com',
                      style: GoogleFonts.nunitoSans(letterSpacing: 2,
                          fontSize: isTab ? h * 0.02 : w * 0.04,
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
                          fontSize: isTab ? h * 0.02 : w * 0.04,
                          color: Pallete.secondoryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowContainer(String title, String value, String imagePath,Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(
        width: isTab?w*0.4:h*0.4,
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
      padding: EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(width: isTab?w*0.4:h*0.4,
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

}
