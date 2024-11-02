import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/core/constant/firebaseconstants.dart';
import 'package:product_project/models/productModel.dart';

import '../../../models/HomesliderModel.dart';

final productRepositoryProvider=Provider((ref) => Productrepository(firestore: ref.read(firestoreProvider)),);
class Productrepository{
  final FirebaseFirestore _firestore;
  Productrepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _products =>
      _firestore.collection(FirebaseConstants.products);

  CollectionReference get _homeslider =>
      _firestore.collection(FirebaseConstants.homeslider);
  
  Stream<List<ProductModel>> productStream({required String search}) {
    if(search.isNotEmpty) {
      return _products.where('delete', isEqualTo: false).where(
          'search', arrayContains: search..toUpperCase().trim())
          .snapshots()
          .map((event) {
        List<ProductModel> products = [];
        for (QueryDocumentSnapshot i in event.docs) {
          products.add(ProductModel.fromMap(i.data() as Map<String, dynamic>));
        }
        return products;
      });
    }else{
      return _products.where('delete', isEqualTo: false)

          .snapshots()
          .map((event) {
        List<ProductModel> products = [];
        for (QueryDocumentSnapshot i in event.docs) {
          products.add(ProductModel.fromMap(i.data() as Map<String, dynamic>));
        }
        return products;
      });
    }
  }

  Stream<List<ProductModel>> productSliderStream() {
    return _products.where('delete',isEqualTo: false).where('latestProduct',isEqualTo: true)
        .snapshots()
        .map((event) {
      List<ProductModel> leave = [];
      for (QueryDocumentSnapshot i in event.docs) {
        leave.add(ProductModel.fromMap(i.data() as Map<String,dynamic>));
      }
      return leave;
    });
  }

  Stream<List<HomeSliderModel>> SliderStream() {
    return _homeslider
        .snapshots()
        .map((event) {
      List<HomeSliderModel> slider = [];
      for (QueryDocumentSnapshot i in event.docs) {
        slider.add(HomeSliderModel.fromMap(i.data() as Map<String,dynamic>));
      }
      return slider;
    });
  }

}