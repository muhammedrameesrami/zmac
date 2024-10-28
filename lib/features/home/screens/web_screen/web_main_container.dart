// import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/function.dart';
import '../../../../core/common/loader.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../product/controller/productController.dart';
import '../../../product/screens/mobile_screen/mobile_productView_screen.dart';
import '../../../product/screens/web_screen/web_product_screen.dart';
final homeSearchProvider=StateProvider<String>((ref) => '',);
class WebMainContainer extends ConsumerStatefulWidget {
  const WebMainContainer({
    super.key,
  });

  @override
  ConsumerState<WebMainContainer> createState() => _WebMainContainerState();
}

class _WebMainContainerState extends ConsumerState<WebMainContainer> {
  final ScrollController controller = ScrollController();

  // int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final imageList=[AssetConstant.mac,AssetConstant.iPad,AssetConstant.groupDevice];
   void  scrollForward() {
     if (controller.hasClients) {
       controller.animateTo(
         controller.position.pixels + MediaQuery.of(context).size.width * 0.5, // Scroll by half the width
         duration: const Duration(milliseconds: 500),
         curve: Curves.easeInOut,
       );
     }
    }

    // Function to scroll backward
    void _scrollBackward() {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.pixels - MediaQuery.of(context).size.width * 0.5, // Scroll by half the width
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

    final isTab=w>h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(height: isTab?h*0.01:w*0.01,),
          /// slider section......................................
          SizedBox(
            height: h * .046,
            width: w * .4,
            child: TextFormField(style: GoogleFonts.roboto(color: Colors.black),
              onChanged: (value) {
              ref.read(homeSearchProvider.notifier).update((state) => value.toUpperCase(),);
              },
              decoration: InputDecoration(suffixIcon: IconButton(icon: Icon(Icons.close,color: Colors.black,),onPressed:() {
                ref.read(homeSearchProvider.notifier).update((state) => '',);
              },),
                filled: true,
                fillColor:Pallete.primaryColor,
                contentPadding: const EdgeInsets.only(),
                prefixIcon: const Icon(Icons.search,color: Colors.black,),
                hintStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,color: Colors.black,
                  fontSize: w * .010,
                ),
                hintText: "Search",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: isTab?h*0.01:w*0.01,),
          ref.watch(homeSearchProvider).isNotEmpty? Consumer(
              builder: (context,ref,child) {
                return ref.watch(productStreamProvider(ref.watch(homeSearchProvider))).when(data: (data) {
                  return Container(height: h*0.8,width: w,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 4, // Number of columns
                        crossAxisSpacing: w * .007, // Spacing between columns
                        mainAxisSpacing: w * .006, // Spacing between rows
                      ),
                      itemCount: data.length, // Number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductViewScreen(productModel: data[index],),));                },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: h * 0.01, left: w * 0.01, right: w * 0.01),
                            child: Container(
                              height: h * 0.52,
                              width: w * 0.15,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Pallete.greyColor,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Pallete.greyColor,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: Pallete.primaryColor,
                                borderRadius: BorderRadius.circular(w * 0.02),
                                border: Border.all(color: Pallete.primaryColor),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: w<=1062?h*0.22:h * 0.23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(w * 0.02)),
                                      child: Center(child: Image.asset(AssetConstant.mac,fit: BoxFit.contain,))),
                                  // SizedBox(height: h*0.007,),
                                  SizedBox(
                                    height: h * 0.05,width: w,
                                    child: Center(
                                      child: Text(
                                        data[index].productname,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w700,
                                            fontSize: w * 0.01),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: h*0.02,),
                                  SizedBox(
                                    width: w ,
                                    height: h * 0.025,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₹ ${data[index].ogprice}",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: w * 0.01,
                                            color: Colors.grey,
                                            decoration: TextDecoration
                                                .lineThrough, // Adds strikethrough effect
                                            decorationThickness:
                                            2.0, // Adjusts thickness of the line (optional)
                                            decorationColor: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: w * 0.006,
                                        ),
                                        Text(
                                          '₹ ${data[index].showprice}',
                                          style: GoogleFonts.roboto(color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: w * 0.01),
                                        ),
                                        SizedBox(
                                          width: w * 0.008,
                                        ),
                                        Text(
                                          '${((int.parse(data[index].ogprice) - int.parse(data[index].showprice)) / int.parse(data[index].ogprice) * 100).round()}% off',
                                          style: GoogleFonts.roboto(color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: w * 0.01),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: InkWell(onTap: () async {

                                      // const url = "https://wa.me/9747941805";
                                      // if (await canLaunchUrl(Uri.parse(url))) {
                                      //   await launchUrl(Uri.parse(url));
                                      // } else {
                                      //   throw 'Could not launch $url';
                                      //
                                      // }
                                      sendWhatsAppMessage(imageUrl: data[index].image,description:  data[index].description,productName:  data[index].productname);
                                    },
                                      child: Container(
                                        height: h * .04,
                                        width: w * .2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.black),
                                        child: Center(
                                          child: Text(
                                            'Share Now ',
                                            style: GoogleFonts.roboto(
                                              color: Pallete.whiteColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: w * .015,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }, error: (error, stackTrace) {
                  print(stackTrace);
                  print(error);
                  return SelectableText(error.toString());
                }, loading: () => Loader(),);

              }
          ):
          Text('NEW ARRIVAL',style: GoogleFonts.roboto(letterSpacing: 3,
              fontSize: isTab?h*0.04:w*0.04,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: isTab?h*0.01:w*0.01,),
          SizedBox(
            height: isTab ? h * 0.4 : w * 0.4,
            width: double.infinity, // Ensure the container takes full width
            child: CarouselSlider.builder(itemCount: 3,itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),child: Image.asset(imageList[index],fit: BoxFit.contain,),
              );
            },

              options: CarouselOptions(
                enableInfiniteScroll: true,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlay: true,
                aspectRatio: 2.4,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
              ),
            ),
          ),
          // SizedBox(height: isTab?h*0.01:w*0.01), // Add spacing between the carousel and the next section
          // SizedBox(
          //   height: isTab ? h * 0.4 : w * 0.8,
          //   child: Container(
          //     // height: double.infinity,
          //     child: Image.asset(
          //       AssetConstant.logo,
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),

                              /// zmac details..................................

          Container(
            padding: const EdgeInsets.all(16), // Optional padding for better text layout
            child:  Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to Zmac Apple Solution',style: GoogleFonts.roboto(fontSize: isTab?h*0.03:w*0.03,fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 3),),
                SizedBox(height: isTab?h*0.02:w*0.02,),
                Text(
                  "Welcome to Zmac Apple Solution Your trusted Apple product expert in Asokpuram, Calicut! With over 1000 satisfied customers, we specialize in the sale of high-quality laptops and offer expert chip-level servicing for all Apple devices. Whether you're looking to buy the latest MacBook or need professional repairs, our experienced team is dedicated to delivering the best in technology solutions. Visit us today and experience reliable service that keeps your Apple products performing at their peak.",
                  textAlign: TextAlign.center,style: GoogleFonts.roboto(fontSize: isTab?h*0.02:w*0.02,letterSpacing: 3),
                ),
              ],
            ),
          ),
          SizedBox(height: isTab ? h * 0.05 : w * 0.05),
          Text('New Features',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: isTab?h*0.02:w*0.02,),
          SizedBox(
            height: isTab ? h * 0.4 : w * 0.5,
            width: w, // Ensure the container takes full width
            child: Stack(alignment: Alignment.center,children: [
             ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,controller:controller ,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding:EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
                     child: Container(width: isTab?w*0.3:h*0.3,
                       height: h * 0.4,
                       decoration: BoxDecoration(
                         image: const DecorationImage(
                           fit: BoxFit.cover,
                           image: AssetImage(AssetConstant.groupDevice),
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
                             'kkdk',
                             style: GoogleFonts.roboto(
                               fontSize: isTab ? h * 0.03 : w * 0.02,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),

                         ],
                       ),
                     ),
                   );
             },

             ),
              Positioned(
                left: 10, // Positioning the next arrow
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    _scrollBackward();
                  },
                ),
              ),
              Positioned(
                right: 10, // Positioning the next arrow
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    scrollForward();
                  },
                ),
              ),
            ],),
          ),
          /// company things

          SizedBox(height: isTab ? h * 0.05 : w * 0.05),
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

          SizedBox(height: isTab ? h * 0.05 : w * 0.05),
          Text('OUR SERVICES',style: GoogleFonts.roboto(fontSize: isTab ? h * 0.03 : w * 0.06,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: isTab?h*0.02:w*0.02,),
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
          // SizedBox(height: isTab ? w * 0.01 : h * 0.01),
          SizedBox(height: isTab?h*0.018:w*0.018,),
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
                SizedBox(height: isTab ? h * 0.05 : w * 0.05),                Text(
                  'Zmac',
                  style: GoogleFonts.roboto(
                    fontSize: isTab ? h * 0.04 : w * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Pallete.secondoryColor,letterSpacing: 2
                  ),
                ),
                SizedBox(height: h * 0.01),
                Row( mainAxisAlignment: MainAxisAlignment.center,
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
                InkWell(onTap: () async {
                  const url = "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";
                  if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                  } else {
                  throw 'Could not launch $url';

                  }
                },
                  child: Text(
                    'Location: Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                    style: GoogleFonts.roboto(letterSpacing: 2,
                        fontSize: isTab ? h * 0.02 : w * 0.06,
                        color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
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
                    style: GoogleFonts.roboto(letterSpacing: 2,
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
                  style: GoogleFonts.roboto(letterSpacing: 2,
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

  Widget _rowContainer(String title, String value, String imagePath,Color color) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: h*0.01,horizontal: w*0.01),
      child: Container(
        width: isTab?w*0.4:h*0.4,
        height: h * 0.4,
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
                fontSize:isTab ? h * 0.03 : w * 0.02,
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
      child: Container(width: isTab?w*0.4:h*0.4,
        height: h * 0.4,
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
}
