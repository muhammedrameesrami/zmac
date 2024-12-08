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
            Text('LOOKING FORWARD',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.028 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

SizedBox(width: w,child: Wrap(alignment: WrapAlignment.center,children: [
  _lookingForwardContainer('Our Mission','Our mission is to deliver innovative and high-quality Apple products and services, sourced from trusted suppliers, and provided with care to every customer. We are dedicated to ensuring customer satisfaction by meeting their needs with cutting-edge technology and exceptional support.',AssetConstant.ourMission),
  _lookingForwardContainer('Our Vision','To be the premier destination for premium Apple products, delivering exceptional quality, unmatched variety, and outstanding service to inspire and empower our customers.',AssetConstant.ourVision  ),
],),),
            SizedBox(height: h * 0.03),
            Text('OUR SUCCESS',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.028 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

            /// total content section
            SizedBox(
              width: w,
              child: Wrap(alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _rowContainer(
                      'TOTAL SALES', '10K+', AssetConstant.macBook,Colors.black),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _rowContainer('TOTAL PRODUCTS', '2000+',
                      AssetConstant.iPad,Pallete.whiteColor  ),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _rowContainer(
                      'HAPPY CUSTOMER', '10K+', AssetConstant.ipods,Colors.white),
                ],
              ),
            ),

            SizedBox(height: isTab ? w * 0.01 : h * 0.01),
Text('APPLE PRODUCT  SALE AND SERVICE',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.028 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              width: w,
              child: Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _serviceContainer(
                      'CHIP LEVEL SERVICE', AssetConstant.chip,Colors.white),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _serviceContainer('CUSTOMER SUPPORT',
                      AssetConstant.customerService,Pallete.whiteColor),
                  SizedBox(width: w * 0.02), // Small space between containers
                  _serviceContainer(
                      'SALES AND SERVICE', AssetConstant.service,Colors.white),
                ],
              ),
            ),
            SizedBox(height: isTab ? w * 0.01 : h * 0.01),

            Text('CONTACT US',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.028 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),

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
                  SizedBox(height: h*0.2,width: w*0.25,child: Image.asset(AssetConstant.zmacLogo),),
                  // Text(
                  //   'Zmac',
                  //   style: GoogleFonts.roboto(
                  //     fontSize: isTab ? h * 0.028 : w * 0.06,
                  //     fontWeight: FontWeight.bold,
                  //     color: Pallete.secondoryColor,
                  //   ),
                  // ),
                  SizedBox(height: h * 0.005),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(onTap: () async {
                        const url = "https://www.instagram.com/zmac.calicut/";
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
                        const url = "https://wa.me/919995245426";

                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          if(context.mounted){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('WhatsApp is not installed on this device')),
                          );}
                        }

                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.watsApp),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                      SizedBox(width: w * 0.02),
                      InkWell(onTap: () async {
                        const url = "https://www.facebook.com/zmac.calicut/";

                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          if(context.mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('WhatsApp is not installed on this device')),
                            );}
                        }

                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.facebook),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                      SizedBox(width: w * 0.02),
                      InkWell(onTap: () async {
                        const url =
                            "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                        child: CircleAvatar(
                            backgroundImage: const AssetImage(AssetConstant.map),
                            radius: isTab ? h * 0.02 : w * 0.06),
                      ),
                      SizedBox(width: w * 0.02),
                      Tooltip(
                        message: "+919995245426", // The number displayed in the tooltip
                        child: CircleAvatar(
                          child: const Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          radius: isTab ? h * 0.02 : w * 0.06,
                        ),
                      ),
                      SizedBox(width: w * 0.02),

                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  // FittedBox(alignment: Alignment.center, fit: BoxFit.fill,
                  //   child: InkWell(onTap: () async {
                  //     const url = "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";
                  //
                  //     if (await canLaunchUrl(Uri.parse(url))) {
                  //     await launchUrl(Uri.parse(url));
                  //     } else {
                  //     throw 'Could not launch $url';
                  //
                  //     }
                  //   },
                  //     child: Text(
                  //       'Location: Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                  //       style: GoogleFonts.roboto(
                  //           fontSize: isTab ? h * 0.02 : w * 0.06,
                  //           color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                  //     ),
                  //   ),
                  // ),
                  InkWell(onTap: () async {
                    const url = "https://zmaccalicut@gmail.com";
                    if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                    } else {
                    throw 'Could not launch $url';

                    }
                  },
                    child: SelectableText(
                      'Email: zmaccalicut@gmail.com',
                      style: GoogleFonts.roboto(
                          fontSize: isTab ? h * 0.03 : w * 0.04,
                          color: Pallete.secondoryColor),
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  SelectableText(
                    'Phone No: +919995245426',
                    style: GoogleFonts.roboto(
                        fontSize: isTab ? h * 0.025 : w * 0.034,
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
        decoration: BoxDecoration(boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),],
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

  Widget _serviceContainer(String title,  String imagePath,Color color) {
      return Padding(
      padding:EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(width: isTab?w*0.3:h*0.6,
        height: h * 0.3,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
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
                fontSize: isTab ? h * 0.028 : w * 0.02,
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
        height: isTab?h * 0.38:w*0.55,
        width: isTab ? w * 0.4 : w * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(w * 0.02),
          border: Border.all(color: Colors.black38),boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ]
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
                        fontSize: isTab ? h * 0.04 : w * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,   ),
                    ),
                    SizedBox(height: h * 0.01),
                    Flexible(
                      child: Text(
                        description,
                        style: GoogleFonts.roboto(
                          fontSize: isTab ? h * 0.02 : w * 0.025,
                          color: Colors.black,
                        ),
                        softWrap: true,
                        // overflow: TextOverflow.ellipsis, // Truncates text on smaller screens
                       // Limits the number of lines to avoid overflow
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
