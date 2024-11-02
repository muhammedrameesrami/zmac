import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_project/core/constant/asset_constant.dart';
import 'package:product_project/models/productModel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart'as http;
import 'dart:io' show File;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;



class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key,required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {


  String deepLink = 'https://zmac-48c3a.web.app/';

  shareEvent({
    required String image,
    required String productId,
    required String productName,
    required String productDescription,
    required BuildContext context,
  }) async {
    try {

      final text = '''
$productName
$productDescription
Check it out here: $deepLink/$productId
''';
      if (kIsWeb) {
        await Share.share(text);
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
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to share the product: $e")),
      );
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
                items: widget.productModel.multipleImages.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.network(
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
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    // const productName = 'MacBook Air 13” and 15 \n M2 or M3 chip';
                    // const originalPrice = '₹ 680000';
                    // const discountedPrice = '₹ 150000';
                    // const discount = '30% off';
                    await shareEvent(context: context,
                    productDescription: widget.productModel.description,productName: widget.productModel.productName,
                    image:AssetConstant.mac,
                    productId:widget.productModel.productId,);
                    // Share the product details using Share Plus
                    // Share.share(
                    //     'Check out this amazing deal!\n\n$productName\nOriginal Price: $originalPrice\nDiscounted Price: $discountedPrice\n$discount',
                    //     subject: 'Special Offer on MacBook Air! http://localhost:61104/}'
                    // );
                    // _shareProductWithImage();
                  },// Call the method here
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

  Future<void> _shareProductWithImage(BuildContext context) async {
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
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to share the product: $e"),
        ) );
      }
    }
  }
}
