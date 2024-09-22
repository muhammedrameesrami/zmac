import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/global_names.dart';
import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';

class MobileProductScreen extends StatefulWidget {
  const MobileProductScreen({
    super.key,
  });

  @override
  State<MobileProductScreen> createState() => _MobileProductScreenState();
}

class _MobileProductScreenState extends State<MobileProductScreen> {
  @override
  Widget build(BuildContext context) {
    print(w);
    final isTab=w>h;

    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            //sambavam  settanallo
            children: [
              Container(
                height:isTab? h * 0.05:h*0.05,
                width: w ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Product count',style: GoogleFonts.nunitoSans(color: Colors.black,fontSize: w*0.03,fontWeight: FontWeight.w500),),
                    SizedBox(
                      height:isTab? h * .035:h*.04,
                      width:isTab? w * .23:w*.6,
                      child: TextFormField(
                        onChanged: (value) {
                          // Perform search logic here
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.only(),
                          prefixIcon: const Icon(Icons.search),
                          hintStyle: GoogleFonts.nunitoSans(
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
                    ), // Price Dropdown
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                  height: h * .06,
                  width: w * .38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedPriceDropdown,
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint:  Text("Sort in Price",style: GoogleFonts.nunitoSans(fontSize: w*0.03),),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPriceDropdown = newValue;
                      });
                    },
                    items: priceRange.map((String price) {
                      return DropdownMenuItem<String>(
                        value: price,
                        child: Text(
                          price,
                          style:  GoogleFonts.nunitoSans(color: Colors.black,fontSize: w*0.03,
                            decoration: TextDecoration.none, // Remove underline
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                  // Features Dropdown
                  Container(
                    height: h * .06,
                    width: w * .35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedFeatureDropdown,
                      decoration: const InputDecoration(border: InputBorder.none),
                      hint:  Text("Select Feature",style: GoogleFonts.nunitoSans(fontSize: w*0.03),),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFeatureDropdown = newValue;
                        });
                      },
                      items: features.map((String feature) {
                        return DropdownMenuItem<String>(
                          value: feature,
                          child: Text(
                            feature,
                            style:  GoogleFonts.nunitoSans(color: Colors.black,fontSize: w*0.03,
                              decoration: TextDecoration.none, // Remove underline
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),],)
            ],
          ),
        ),
        Expanded(

          child:GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:isTab?1.5: 0.65,
              crossAxisCount:
              2, // Number of columns
              crossAxisSpacing: w *
                  .01, // Spacing between columns
              mainAxisSpacing: w *
                  .006, // Spacing between rows
            ),
            itemCount: 20, // Number of items in the grid
            itemBuilder: (BuildContext context,
                int index) {


              return GestureDetector(
                onTap: () {
                  // Handle tap on the grid item
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: h * 0.01, left: w * 0.008, right: w * 0.008),
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
                      borderRadius: BorderRadius.circular(w * 0.02),
                      border: Border.all(color: Pallete.primaryColor),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: w>=500?h*0.2:h * 0.19,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.circular(w * 0.02)),
                              child: Center(
                                  child: Icon(
                                    Icons.image,
                                    size: w * 0.05,
                                  ))),
                          // SizedBox(height: h*0.007,),
                          Container(
                            height: h * 0.05,width: w,
                            child: Center(
                              child: Text(
                                'product name and description ',
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w * 0.03),
                              ),
                            ),
                          ),
                          // SizedBox(height: h*0.04,),
                          Container(
                            width: w ,
                            height: w<=903?h*0.03: h * 0.023,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '₹ 200',
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize:isTab?h*0.02: w * 0.03,
                                    color: Colors.grey,
                                    decoration: TextDecoration
                                        .lineThrough, // Adds strikethrough effect
                                    decorationThickness:
                                    2.0, // Adjusts thickness of the line (optional)
                                    decorationColor: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.009,
                                ),
                                Text(
                                  '₹ 200',
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab?h*0.02: w * 0.03),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                Text(
                                  '60% off',
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize:isTab?h*0.02: w * 0.03),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h*0.008,),
                          Container(
                            height: h * .04,
                            width: w * .38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                'WhatsApp ',
                                style: GoogleFonts.nunitoSans(
                                  color: Pallete.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isTab?h*0.01: w * 0.015,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
