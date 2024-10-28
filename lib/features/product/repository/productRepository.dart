import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/core/constant/firebaseconstants.dart';
import 'package:product_project/models/productModel.dart';

final productRepositoryProvider=Provider((ref) => Productrepository(firestore: ref.read(firestoreProvider)),);
class Productrepository{
  final FirebaseFirestore _firestore;
  Productrepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _products =>
      _firestore.collection(FirebaseConstants.products);
  
  Stream<List<ProductModel>> productStream({required String search}) {
    return _products.where('delete',isEqualTo: false).where('search',arrayContains: search..toUpperCase().trim())
        .snapshots()
        .map((event) {
      List<ProductModel> leave = [];
      for (QueryDocumentSnapshot i in event.docs) {
        leave.add(ProductModel.fromMap(i.data() as Map<String,dynamic>));
      }
      return leave;
    });
  }

  Stream<List<ProductModel>> productSliderStream() {
    return _products.where('delete',isEqualTo: false).where('latestproduct',isEqualTo: true)
        .snapshots()
        .map((event) {
      List<ProductModel> leave = [];
      for (QueryDocumentSnapshot i in event.docs) {
        leave.add(ProductModel.fromMap(i.data() as Map<String,dynamic>));
      }
      return leave;
    });
  }

}