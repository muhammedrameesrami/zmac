import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_project/features/product/repository/productRepository.dart';

import '../../../models/HomesliderModel.dart';
import '../../../models/productModel.dart';
final homeSliderStreamProvider=StreamProvider((ref) => ref.read(productControollerProvider).sliderStream(),);
final productSliderStreamProvider=StreamProvider((ref) => ref.read(productControollerProvider).productSliderStream(),);
final productStreamProvider=StreamProvider.family((ref,String search) => ref.read(productControollerProvider).productStream(search: search),);
final productControollerProvider=Provider((ref) => ref.read(productRepositoryProvider),);
class Productcontroller {
  final Productrepository _repository;

  Productcontroller({required Productrepository repository})
      : _repository = repository;

  Stream<List<ProductModel>> productStream({required String search}) {
    return _repository.productStream(search: search);
  }

  Stream<List<ProductModel>> productSliderStream() {
    return _repository.productSliderStream();
  }

  Stream<List<HomeSliderModel>> sliderStream() {
    return _repository.sliderStream();
  }

}