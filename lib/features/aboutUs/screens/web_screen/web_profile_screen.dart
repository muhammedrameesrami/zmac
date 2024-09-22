
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/variables.dart';
import '../../../../core/theme/pallete.dart';

class WebAboutUsScreen extends StatelessWidget {
  const WebAboutUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: h * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: h * 0.6,
                    width: w * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Pallete.primaryColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: h * 0.03),
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage(
                              'assets/images/defaultStoreImage-web.png'),
                          backgroundColor: Pallete.primaryColor,
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              heightFactor: h * 0.14,
                              widthFactor: w * 0.05,
                              child: CircleAvatar(
                                radius: 20.1,
                                backgroundColor: Pallete.blackColor,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Pallete.primaryColor,
                                  child: Center(
                                    child: Icon(Icons.edit_rounded,
                                        color: Pallete.secondoryColor,
                                        size: w * 0.016),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: h * 0.01),
                        Text(
                          "shopeModel.name",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: w * 0.02),
                        ),
                        Text(
                          "shopeModel.category",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: w * 0.01),
                        ),
                        SizedBox(height: h * 0.05),
                        Container(
                          width: w * 0.310,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Pallete.primaryColor,
                          ),
                          height: w * 0.08,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: w * 0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: w * 0.02),
                                      child: Text("shopeModel.subscriptionId",
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Pallete.secondoryColor,
                                              fontSize: w * 0.015)),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: w * 0.03),
                                      child: Text(
                                        'Expire on  : ',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Pallete.secondoryColor,
                                            fontSize: w * 0.012,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: w * 0.02),
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    height: h * 0.06,
                                    width: w * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Pallete.primaryColor,),
                                    child: Center(
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Pallete.secondoryColor,
                                          size: w * 0.02,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.04),
                  Container(
                    height: h * 0.6,
                    width: w * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Pallete.primaryColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.09, left: w * 0.03),
                          child: Row(children: [
                            InkWell(
                              onTap: () {

                              },
                              child: Icon(Icons.edit,
                                  color: Colors.black, size: w * 0.02),
                            ),
                            SizedBox(height: h * 0.05),
                            SizedBox(width: w * 0.01),
                            InkWell(
                              onTap: () {

                              },
                              child: Text(
                                'edit Shop Profiler',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: w * 0.02,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.08, left: w * 0.03),
                          child: Row(children: [
                            Consumer(
                              builder: (context, ref, child) => InkWell(
                                onTap: () {

                                },
                                child: Icon(Icons.logout,
                                    color: Colors.black, size: w * 0.02),
                              ),
                            ),
                            SizedBox(width: w * 0.01),
                            Consumer(
                              builder: (context, ref, child) => InkWell(
                                onTap: () {

                                },
                                child: Text(
                                  'LOG OUT',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: w * 0.02,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
