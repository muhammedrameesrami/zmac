import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/asset_constant.dart';
import '../../../../core/constant/variables.dart';
import '../../../aboutUs/screens/web_screen/web_profile_screen.dart';
import '../../../product/screens/mobile_screen/mobile_product_screen.dart';

class MobileMainContainer extends StatelessWidget {
  const MobileMainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(

        children: [
          // Home Tab content - Red container
          Padding(
            padding:  EdgeInsets.only(left: w*0.01,right: w*0.01,top: h*0.01),
            child: Container(width: w,
              child: Column(children: [
                Expanded(child: Container(width: w,child: Image.asset(AssetConstant.logo))),
                Expanded(child: Container(width: w,child: Center(child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available')))),

              ],),
            ),
          ),
          // Product Tab content
          MobileProductScreen(),
          // Profile Tab content
          const WebAboutUsScreen(),
        ],
      ),
    );
  }
}
