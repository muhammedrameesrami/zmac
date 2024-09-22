import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/variables.dart';
import '../../../product/screens/mobile_screen/mobile_product_screen.dart';
import '../../../profile/screens/web_screen/web_profile_screen.dart';

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
          Expanded(
            child:Padding(
              padding:  EdgeInsets.only(left: w*0.01,right: w*0.01,top: h*0.01),
              child: Container(height: h*0.8,width: w,
                child: Column(children: [
                  Container(width: w,height: h*0.5,child: Center(child: Icon(Icons.image,size: w*0.3,))),
                  Container(width: w,height: h*0.416,child: Center(child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available'))),

                ],),
              ),
            ) ,
          ),
          // Product Tab content
          MobileProductScreen(),
          // Profile Tab content
          const WebProfileScreen(),
        ],
      ),
    );
  }
}
