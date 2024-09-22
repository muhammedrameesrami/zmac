import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/pallete.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      backgroundColor: Pallete.secondoryColor,
      content: Text(
        content,
        style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500, color: Pallete.whiteColor),
      ),
    ));
}