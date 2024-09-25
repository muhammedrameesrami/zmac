import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:share_plus/share_plus.dart';


class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final List<String> _imageUrls = [
    AssetConstant.mac,
    AssetConstant.iPad,
    AssetConstant.groupDevice
  ];

  final String _productName = "Product Name";
  final String _productDescription = "This is a detailed description of the product.";
  final double _originalPrice = 1000.0;
  final double _offerPrice = 800.0;

  late double w, h;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    final isTab = w > h;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _productName,
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable Image Container
              CarouselSlider(
                options: CarouselOptions(
                  height: isTab?h*0.5:w*0.5,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: _imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                        // width: double.infinity,
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Product Name
              Text(
                _productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Product Description
              Text(
                _productDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              // Price and Offer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${_offerPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "₹${_originalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // WhatsApp Button
              SizedBox(
                width: isTab ? w * 0.3 : h * 0.3,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _shareProductWithImage, // Call the method here
                  icon: const Icon(CupertinoIcons.chat_bubble_text),
                  label: const Text(
                    "Order on WhatsApp",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareProductWithImage() async {
    try {
      // Assuming the images are locally stored, modify the logic if needed
      final imageUrl = _imageUrls.first; // You can choose the first image or any other
      final ByteData bytes = await rootBundle.load(imageUrl); // Load local image
      final Uint8List list = bytes.buffer.asUint8List();

      final documentDirectory = await getTemporaryDirectory();
      final imageFile = File('${documentDirectory.path}/shared_image.png');
      await imageFile.writeAsBytes(list);

      // Product details to share
      final String shareText = '''
Product: $_productName
Description: $_productDescription
Original Price: ₹${_originalPrice.toStringAsFixed(2)}
Offer Price: ₹${_offerPrice.toStringAsFixed(2)}

Check out this amazing product!
''';

      // Share the image and text
      Share.shareXFiles([XFile(imageFile.path)], text: shareText);
    } catch (e) {
      // print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to share the product: $e"),
        ) );
    }
  }
}
