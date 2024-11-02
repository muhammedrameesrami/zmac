import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String description;
  String image;
  bool delete;
  bool latestProduct;
  String ogprice;
  String productName;
  List search;
  String showprice;
  String productId;
  List multipleImages;

  ProductModel({
required this.search,
required this.delete,
required this.description,
required this.image,
required this.latestProduct,
required this.ogprice,
required this.productName,
required this.showprice,
required this.multipleImages,
    required this.productId,
  });

  ProductModel copyWith({
    String? description,
    String ?image,
    bool ?delete,
    bool? latestProduct,
    String ?ogprice,
    String? productName,
    List ?search,
    String ?showprice,
    String?productId,
    List ?multipleImages,
  }) {
    return ProductModel(multipleImages: multipleImages??this.multipleImages,
      image: image??this.image,
      delete: delete??this.delete,
      description: description??this.description,
      latestProduct: latestProduct??this.latestProduct,
      ogprice: ogprice??this.ogprice,
      productName: productName??this.productName,
      search: search??this.search,
      showprice: showprice??this.showprice,
      productId: productId??this.productId,
      );
  }

  Map<String, dynamic> toMap() {
    return {
     'showprice':showprice,
      'search':search,
      'productName':productName,
      'ogprice':ogprice,
      'latestProduct':latestProduct,
      'image':image,
      'description':description,
      'delete':delete,
      'productId':productId,
      'multipleImages':multipleImages,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
    showprice: map['showprice']??'',
      search: map['search']??[],
      productName: map['productName']??'',
      ogprice: map['ogprice']??'',
      latestProduct: map['latestProduct']??false,
      description: map['description']??'',
      delete: map['delete']??false,
      image: map['image']??'',
      productId: map['productId']??'',
      multipleImages: map['multipleImages']??[],

    );
  }
}
