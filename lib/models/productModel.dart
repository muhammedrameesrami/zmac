import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String description;
  String image;
  bool delete;
  bool latestproduct;
  String ogprice;
  String productname;
  List search;
  String showprice;
  String productId;

  ProductModel({
required this.search,
required this.delete,
required this.description,
required this.image,
required this.latestproduct,
required this.ogprice,
required this.productname,
required this.showprice,
    required this.productId,
  });

  ProductModel copyWith({
    String? description,
    String ?image,
    bool ?delete,
    bool? latestproduct,
    String ?ogprice,
    String? productname,
    List ?search,
    String ?showprice,
    String?productId,
  }) {
    return ProductModel(
      image: image??this.image,
      delete: delete??this.delete,
      description: description??this.description,
      latestproduct: latestproduct??this.latestproduct,
      ogprice: ogprice??this.ogprice,
      productname: productname??this.productname,
      search: search??this.search,
      showprice: showprice??this.showprice,
      productId: productId??this.productId,
      );
  }

  Map<String, dynamic> toMap() {
    return {
     'showprice':showprice,
      'search':search,
      'productname':productname,
      'ogprice':ogprice,
      'latestproduct':latestproduct,
      'image':image,
      'description':description,
      'delete':delete,
      'productId':productId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
    showprice: map['showprice']??'',
      search: map['search']??[],
      productname: map['productname']??'',
      ogprice: map['ogprice']??'',
      latestproduct: map['latestproduct']??false,
      description: map['description']??'',
      delete: map['delete']??false,
      image: map['image']??'',
      productId: map['productId']??'',

    );
  }
}
