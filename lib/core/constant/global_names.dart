import 'package:flutter/cupertino.dart';

TextEditingController search = TextEditingController();

// Declare the list of causes for the dropdown
List<String> priceRange = ['Price: Low To High', 'Price: High To Low'];
String? selectedPriceDropdown;
List<String> features = ['New', 'Upcoming', 'Current'];
String? selectedFeatureDropdown;