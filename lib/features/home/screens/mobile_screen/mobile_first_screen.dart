import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/features/home/screens/web_screen/web_main_container.dart';

import '../../../../core/common/function.dart';
import '../../../../core/common/loader.dart';
import '../../../../core/constant/asset_constant.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../product/controller/productController.dart';
import '../../../product/screens/mobile_screen/mobile_productView_screen.dart';

class MobileFirstScreen extends ConsumerStatefulWidget {
  const MobileFirstScreen({super.key});

  @override
  ConsumerState<MobileFirstScreen> createState() => _MobileFirstScreenState();
}

class _MobileFirstScreenState extends ConsumerState<MobileFirstScreen> {
  final ScrollController controller = ScrollController();
  final TextEditingController srearchController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    void scrollForward() {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.pixels +
              MediaQuery.of(context).size.width *
                  0.5, // Scroll by half the width
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

    // Function to scroll backward
    void scrollBackward() {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.pixels -
              MediaQuery.of(context).size.width *
                  0.5, // Scroll by half the width
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

    final isTab = w > h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isTab ? w * .04 : w * .02,
          vertical: isTab ? h * .04 : h * .02),
      child: SizedBox(
        width: w,
        height: h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // height: isTab ? h * .045 : w * .06,
                // width:isTab? w * .23:w*.6,
                child: TextFormField(controller: srearchController,
                  style: GoogleFonts.roboto(color: Colors.black),
                  onChanged: (value) {
                    ref.read(homeSearchProvider.notifier).update(
                          (state) => value.toUpperCase(),
                        );
                    // Perform search logic here
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ref.read(homeSearchProvider.notifier).update(
                              (state) => '',
                            );
                        srearchController.clear();
                      },
                    ),
                    filled: true,
                    fillColor: Pallete.primaryColor,
                    contentPadding: const EdgeInsets.only(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: isTab ? h * 0.03 : w * 0.04,
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
              ref.watch(homeSearchProvider).isNotEmpty
                  ? Consumer(builder: (context, ref, child) {
                      return ref
                          .watch(productStreamProvider(
                              ref.watch(homeSearchProvider)))
                          .when(
                            data: (data) {
                              return data.isEmpty?SizedBox(height:h*0.85,width:w,child: const Center(child: Text('NO PRODUCTS'),)): SizedBox(
                                height: h * 0.85,
                                width: w,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: isTab ? 1.5 : 0.84,
                                    crossAxisCount: 2, // Number of columns
                                    crossAxisSpacing:
                                        w * .01, // Spacing between columns
                                    mainAxisSpacing:
                                        w * .006, // Spacing between rows
                                  ),
                                  itemCount: data
                                      .length, // Number of items in the grid
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(builder: (context) =>  ProductViewScreen(
                                              productModel: data[index],
                                            ),));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: h * 0.01,
                                            left: w * 0.008,
                                            right: w * 0.008),
                                        child: Container(
                                          height: h * 0.5,
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
                                            borderRadius:
                                                BorderRadius.circular(w * 0.02),
                                            border: Border.all(
                                                color: Pallete.primaryColor),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                    // height: w>=500?h*0.2:h * 0.19,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    w * 0.02)),
                                                    child: Center(
                                                        child: Image.network(
                                                      data[index].image,
                                                      fit: BoxFit.contain,
                                                    ))),
                                              ),
                                              // SizedBox(height: h*0.007,),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    data[index].productName,
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: w > h
                                                            ? h * 0.02
                                                            : w * 0.03),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(height: h*0.04,),
                                              Expanded(
                                                // width: w ,
                                                // height: w<=903?h*0.03: h * 0.023,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "₹ ${data[index].showprice}",
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: isTab
                                                            ? h * 0.02
                                                            : w * 0.03,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration
                                                            .lineThrough, // Adds strikethrough effect
                                                        decorationThickness:
                                                            2.0, // Adjusts thickness of the line (optional)
                                                        decorationColor:
                                                            Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w * 0.009,
                                                    ),
                                                    Text(
                                                      "₹ ${data[index].showprice}",
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: isTab
                                                              ? h * 0.02
                                                              : w * 0.03),
                                                    ),
                                                    SizedBox(
                                                      width: w * 0.01,
                                                    ),
                                                    Text(
                                                      '${((int.parse(data[index].ogprice) - int.parse(data[index].showprice)) / int.parse(data[index].ogprice) * 100).round()}% off',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: isTab
                                                              ? h * 0.02
                                                              : w * 0.03),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(height: h*0.008,),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () async {
                                                    sendWhatsAppMessage(imageUrl: data[index].image,description:  data[index].description,productName:  data[index].productName);

                                                  },
                                                  child: Container(
                                                    // height: h * .04,
                                                    width: w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.black),
                                                    child: Center(
                                                      child: Text(
                                                        'BUY NOW',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color: Pallete
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: isTab
                                                              ? h * 0.02
                                                              : w * 0.03,
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
                            },
                            error: (error, stackTrace) =>
                                SelectableText(error.toString()),
                            loading: () => const Loader(),
                          );
                    })
                  : Text(
                      'Welcome to Zmac Solution',
                      style: GoogleFonts.roboto(
                          fontSize: isTab ? h * 0.04 : w * 0.04,
                          color: Colors.black,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold),
                    ),
              // SizedBox(height: isTab?h*0.01:w*0.01,),
              SizedBox(
                height: isTab ? h * 0.4 : w * 0.5,
                width: w, // Ensure the container takes full width
                child: Consumer(builder: (context, ref, child) {
                  return ref.watch(homeSliderStreamProvider).when(
                        data: (data) {
                          return CarouselSlider.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index, realIndex) {
                              return Consumer(
                                builder: (context, ref, child) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //   fit: BoxFit.cover, // Ensures the image covers the entire container
                                      //   image: AssetImage(imagePath),
                                      // ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Image.network(
                                      data[index].imageurl,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              initialPage: 0,
                              scrollDirection: Axis.horizontal,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlay: true,
                              aspectRatio: 2.3,
                              viewportFraction: 0.9,
                              enlargeCenterPage: true,
                            ),
                          );
                        },
                        error: (error, stackTrace) =>
                            SelectableText(error.toString()),
                        loading: () => const Loader(),
                      );
                }),
              ),
              // SizedBox(
              //     height: isTab ? w * 0.5 : h / w * 120,
              //     width: w,
              //     child: Image.asset(
              //       AssetConstant.logo,
              //       fit: BoxFit.fill,
              //     )),

              SizedBox(
                height: isTab ? h * 0.018 : w * 0.018,
              ),
              SizedBox(
                  width: w,
                  child: Center(
                      child: Text(
                        "Zmac Apple Solution, based in Calicut,Kerala specializes in certified pre-owned MacBooks, with a strong reputation built over five years and more than 10,000 satisfied customers. Each MacBook comes with a 1-year service warranty, ensuring quality and dependable support for buyers. ZMac's rigorous quality checks and customer-first approach make it a trusted choice for those seeking reliable, affordable Apple MacBooks in Calicut and beyond."
                        ,style: GoogleFonts.roboto(
                        fontSize: isTab ? h * 0.02 : w * 0.026,
                        color: Colors.black,
                        letterSpacing: isTab ? 10 : 4),
                  ))),
              SizedBox(
                height: isTab ? h * 0.03 : w * 0.05,
              ),
              Text(
                'NEW ARRIVALS',
                style: GoogleFonts.roboto(
                    fontSize: isTab ? h * 0.03 : w * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: isTab ? h * 0.025 : w * 0.025,
              ),
              Container(
                height: isTab ? h * 0.52 : w * 0.75,
                width: w, // Ensure the container takes full width
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Consumer(builder: (context, ref, child) {
                      return ref.watch(productSliderStreamProvider).when(
                            data: (data) {
                              return ListView.builder(
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                itemBuilder: (context, index) {
                                  return InkWell(onTap: () {
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductViewScreen(productModel: data[index]),));
                                  },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01,
                                          horizontal: w * 0.01),
                                      child: Container(
                                        width: isTab ? w * 0.3 : h * 0.3,
                                        height: h * 0.55,
                                        decoration: BoxDecoration(
                                          // image: DecorationImage(
                                          //   fit: BoxFit.cover,
                                          //   image:
                                          //       NetworkImage(data[index].image),
                                          // ),
                                          // color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(w * 0.02),
                                          border:
                                              Border.all(color: Colors.black38),
                                        ),
                                        child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.network(data[index].image,fit: BoxFit.contain,height: h*0.3,width: w*.38,),
                                            Container(height:isTab?h*0.1: w*0.1*0.5,
                                              child: Center(
                                                child: Text(
                                                  data[index].productName,
                                                  style: GoogleFonts.roboto(
                                                    // fontSize:
                                                    //     isTab ? h * 0.02 : w * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            error: (error, stackTrace) =>
                                SelectableText(error.toString()),
                            loading: () => const Loader(),
                          );
                    }),
                    Positioned(
                      left: 10, // Positioning the next arrow
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          scrollBackward();
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
                  ],
                ),
              ),
              SizedBox(
                height: isTab ? h * 0.03 : w * 0.05,
              ),

              SizedBox(
                height: isTab ? h * 0.03 : w * 0.05,
              ),
              Text(
                'APPLE PRODUCT SALE AND SERVICE',
                style: GoogleFonts.roboto(
                    fontSize: isTab ? h * 0.03 : w * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: isTab ? h * 0.018 : w * 0.018,
              ),
              SizedBox(
                width: w,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _serviceContainer(
                        'CHIP LEVEL SERVICE', AssetConstant.chip, Colors.white),
                    SizedBox(width: w * 0.02), // Small space between containers
                    _serviceContainer('CUSTOMER SUPPORT',
                        AssetConstant.customerService, Pallete.whiteColor),
                    SizedBox(width: w * 0.02), // Small space between containers
                    _serviceContainer('SALES AND SERVICE',
                        AssetConstant.service, Colors.white),
                  ],
                ),
              ),
              SizedBox(height: isTab ? w * 0.018 : h * 0.018),
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
                    SizedBox(
                      height: isTab ? h * 0.03 : w * 0.05,
                    ),
                    SizedBox(height: h*0.2,width: w*0.25,child: Image.asset(AssetConstant.zmacLogo),),
                    // Text(
                    //   'Zmac',
                    //   style: GoogleFonts.roboto(
                    //     fontSize: isTab ? h * 0.03 : w * 0.06,
                    //     fontWeight: FontWeight.bold,
                    //     letterSpacing: 3,
                    //     color: Pallete.secondoryColor,
                    //   ),
                    // ),
                    SizedBox(
                      height: isTab ? h * 0.018 : w * 0.018,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = "https://www.instagram.com/zmac.calicut/";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: CircleAvatar(
                              backgroundImage:
                                  const AssetImage(AssetConstant.instagram),
                              radius: isTab ? h * 0.02 : w * 0.05),
                        ),
                        SizedBox(width: w * 0.02),
                        InkWell(
                          onTap: () async {
                            const url = "https://www.facebook.com/zmac.calicut/";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: CircleAvatar(
                              backgroundImage:
                              const AssetImage(AssetConstant.facebook),
                              radius: isTab ? h * 0.02 : w * 0.05),
                        ),
                        SizedBox(width: w * 0.02),
                        InkWell(
                          onTap: () async {
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
                              backgroundImage:
                                  const AssetImage(AssetConstant.watsApp),
                              radius: isTab ? h * 0.02 : w * 0.05),
                        ),
                        SizedBox(width: w * 0.02),
                        InkWell(
                          onTap: () async {
                            const url =
                                "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: CircleAvatar(
                              backgroundImage:
                                  const AssetImage(AssetConstant.map),
                              radius: isTab ? h * 0.02 : w * 0.05),
                        ),
                        SizedBox(width: w * 0.02),
                        Tooltip( message: "+919995245426",
                          child: CircleAvatar(
                              child: const Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              radius: isTab ? h * 0.02 : w * 0.05),
                        ),
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () async {
                    //       const url =
                    //           "https://www.google.com/maps/place/ZMAC+Solutions+Calicut/@11.2660295,75.7775614,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba659be300376f9:0x1529f08de7fa8319!8m2!3d11.2660243!4d75.7801363!16s%2Fg%2F11svmp1zv6?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAyMy4wIKXMDSoASAFQAw%3D%3D";
                    //
                    //       if (await canLaunch(url)) {
                    //         await launch(url);
                    //       } else {
                    //         throw 'Could not launch $url';
                    //       }
                    //     },
                    //     child: Text(
                    //       'Location : Pootholi Building, Kiliyanad Road, behind Rajendra Hospital, Kozhikode, Kerala 673001',
                    //       style: GoogleFonts.roboto(
                    //           letterSpacing: 2,
                    //           fontSize: isTab ? h * 0.02 : w * 0.04,
                    //           color: Colors.blue,
                    //           decoration: TextDecoration.underline,
                    //           decorationColor: Colors.blue),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: h * 0.01),
                    InkWell(
                      onTap: () async {
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
                            letterSpacing: 2,
                            fontSize: isTab ? h * 0.02 : w * 0.04,
                            color: Pallete.secondoryColor),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    SelectableText(
                      'Contact No: +919995245426',
                      style: GoogleFonts.roboto(
                          letterSpacing: 2,
                          fontSize: isTab ? h * 0.02 : w * 0.03,
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
                          letterSpacing: 2,
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

  Widget _serviceContainer(String title, String imagePath, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
      child: Container(
        width: isTab ? w * 0.4 : h * 0.4,
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
