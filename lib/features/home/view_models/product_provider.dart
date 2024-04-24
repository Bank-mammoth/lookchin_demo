
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product_model.dart';
import '../repo/provider/product_repository_provider.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  @override
  Future<List<ProductModel>?> build() {
    return Future<List<ProductModel>?>.value();
  }

  Future<void> fetchProduct() async {
    print('is Active');
    state = const AsyncLoading();

    try {
      state = await AsyncValue.guard(() async {
        final productlist =
            await ref.read(productRepositoryProvider).fetchProduct();
        return productlist;
      });
    } catch (e) {
      throw Exception();
    }
  }
}
