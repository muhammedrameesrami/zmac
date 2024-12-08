import 'package:url_launcher/url_launcher.dart';

Future<void> sendWhatsAppMessage({
  required String imageUrl,
  required String productName,
  required String description,
}) async {
  final message = Uri.encodeComponent(
    "$productName\n$description\n I want this product: $imageUrl",
  );

  final whatsappUrl = "https://wa.me/919995245426?text=$message";

  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw "Could not launch $whatsappUrl";
  }
}