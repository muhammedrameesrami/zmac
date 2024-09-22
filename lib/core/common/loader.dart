
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/pallete.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Pallete.secondoryColor,
      ),
    );
  }
}
