import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_project/core/common/loader.dart';
import 'package:product_project/features/product/controller/productController.dart';

import '../../../../core/common/function.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';
import '../mobile_screen/mobile_productView_screen.dart';
final productSearchProvider=StateProvider<String>((ref) => '',);

class WebProductScreen extends ConsumerStatefulWidget {
  const WebProductScreen({
    super.key,
  });

  @override
  ConsumerState<WebProductScreen> createState() => _WebProductScreenState();
}

class _WebProductScreenState extends ConsumerState<WebProductScreen> {
  final TextEditingController searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    // final isTab=w>h;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: h * 0.07,
            width: w ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  // height: h * .046,
                  width: w * .4,
                  child: TextFormField(controller: searchController,
                    style: GoogleFonts.roboto(color: Colors.black),
                    onChanged: (value) {
                    ref.read(productSearchProvider.notifier).update((state) => value.toUpperCase(),);
                    },
                    decoration: InputDecoration(suffixIcon: IconButton(icon: const Icon(Icons.close,color: Pallete.secondoryColor,),onPressed: () {
                      ref.read(productSearchProvider.notifier).update((state) => '',);
                      searchController.clear();
                    },),
                      filled: true,
                      fillColor:Pallete.primaryColor,
                      contentPadding: const EdgeInsets.only(),
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
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
                // Price Dropdown
                // Container(
                //   height: h * .06,
                //   width: w * .16,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(color: Colors.black),
                //   ),
                //   child: DropdownButtonFormField<String>(
                //     value: selectedPriceDropdown,
                //     decoration: const InputDecoration(border: InputBorder.none),
                //     hint:  Text("Price: Low To High",style: GoogleFonts.nunitoSans(fontSize: w*0.01),),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         selectedPriceDropdown = newValue;
                //       });
                //     },
                //     items: priceRange.map((String price) {
                //       return DropdownMenuItem<String>(
                //         value: price,
                //         child: Text(
                //           price,
                //           style:  GoogleFonts.nunitoSans(color: Colors.black,fontSize: w*0.01,
                //             decoration: TextDecoration.none, // Remove underline
                //           ),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context,ref,child) {
              return ref.watch(productStreamProvider(ref.watch(productSearchProvider))).when(data: (data) {
                return GridView.builder(
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

                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductViewScreen(productModel: data[index],),));                },
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
                              SizedBox(
                                  height: w<=1062?h*0.22:h * 0.23,
                                child: Center(
                                  child: data[index].image.isNotEmpty
                                      ? Image.network(
                                    data[index].image,
                                    fit: BoxFit.contain,
                                  )
                                      : const Icon(Icons.image_not_supported, size: 50, color: Colors.grey), // Placeholder for null or empty images
                                ),
                              ),
                              // SizedBox(height: h*0.007,),
                              SizedBox(
                                height: h * 0.05,width: w,
                                child: Center(
                                  child: Text(
                                    data[index].productName,
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
                                    Text(' 80% Off',
                                      // '${((int.parse(data[index].ogprice) - int.parse(data[index].showprice)) / int.parse(data[index].ogprice) * 100).round()}% off',
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
                                  sendWhatsAppMessage(imageUrl: data[index].image,description:  data[index].description,productName:  data[index].productName);
                                },
                                  child: Container(
                                    height: h * .04,
                                    width: w * .2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Center(
                                      child: Text(
                                        'BUY NOW',
                                        style: GoogleFonts.roboto(
                                          color: Pallete.whiteColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: w * .01,
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
                );
              }, error: (error, stackTrace) {
                return SelectableText(error.toString());
              }, loading: () => const Loader(),);

            }
          ),
        ),
      ],
    );
  }
}
