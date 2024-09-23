import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_project/core/constant/asset_constant.dart';

import '../../../../core/constant/variables.dart';

class WebMainContainer extends StatelessWidget {
  const WebMainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: w * 0.03, right: w * 0.03, top: h * 0.05),
          child: Container(height: h*0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        height: h * 0.8,
                        child: Image.asset(AssetConstant.logo))),
                Expanded(
                  child: Container(
                      // width: w * 0.4,
                      height: h * 0.8,
                      child: Center(
                          child: Text(
                              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available'))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
