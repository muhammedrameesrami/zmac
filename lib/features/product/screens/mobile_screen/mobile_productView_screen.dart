import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:product_project/models/productModel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart'as http;
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../core/common/function.dart';



class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key,required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {



  shareEvent({
    required String image,
    required String productId,
    required String productName,
    required String productDescription,
    required BuildContext context,
  }) async {
    try {
      String deepLink = 'https://zmacsolutions.in/products/$productId';

      final text = '''
$productName
$productDescription
Check it out here: $deepLink
''';
      if (kIsWeb) {
        await Share.share(text,subject: 'Check out this product!',);
      } else {
        final url = Uri.parse(image);
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;
          final temp = await getApplicationDocumentsDirectory();
          final path = '${temp.path}/image.jpg';
          File newFile=await File(path).writeAsBytes(bytes);

          // Share the image along with text
          await Share.shareXFiles([XFile(newFile.path)], text: text);
        } else {
          throw Exception("Failed to load image");
        }
      }
    } catch (e) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to share the product: $e")),
        );
      }
    }
  }

  Future<void> shareImage(String imageUrl, String caption) async {
      http.Response response = await http.get(Uri.parse(imageUrl));
      final directory = await getTemporaryDirectory();
      final path = directory.path;
      final file = File('$path/image.png');
      await  file.writeAsBytes(response.bodyBytes);
      String newPath = file.path;
      await Share.shareXFiles([XFile(newPath)], text: caption);
  }


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
         widget.productModel.productName,
          style: GoogleFonts.roboto(
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
                items: List.generate(widget.productModel.multipleImages.length, (index) {
                  return Image.network(
                    widget.productModel.multipleImages[index],
                    fit: BoxFit.fill,
                    // width: double.infinity,
                  );
                },)
              ),
              const SizedBox(height: 20),
              // Product Name
              Text(
              widget.productModel.productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Product Description
              Text(
              widget.productModel.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              // Price and Offer
              Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "₹${widget.productModel.showprice}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: w*0.03,),
                  Text(
                    "₹${widget.productModel.ogprice}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,decorationColor: Colors.red
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // WhatsApp Button
              SizedBox(
                width: isTab ? w * 0.09 : h * 0.2,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {

                    await shareEvent(context: context,
                      productDescription: widget.productModel.description,productName: widget.productModel.productName,
                      image:widget.productModel.image,
                      productId:widget.productModel.productId,);

                  },
                  icon: const Icon(Icons.share),
                  label: const Text(
                    "Share Now",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: isTab ? w * 0.2 : h * 0.3,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    sendWhatsAppMessage(
                        imageUrl: widget.productModel.image,
                        description:
                        widget.productModel.description,
                        productName:
                        widget.productModel.productName);
                  },// Call the method here
                  icon: const Icon(Icons.ads_click),
                  label: const Text(
                    "Buy Now",
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


}
