import 'package:riverpod/src/async_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product_model.dart';
import '../repo/provider/product_repository_provider.dart';

part 'product_provider.g.dart';

// ########################################[ old version ]########################################
@riverpod
class Product extends _$Product {
  @override
  Future<List<ProductModel>?> build() {
    return Future<List<ProductModel>?>.value();
  }

  Future<void> fetchProduct() async {
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

// productProvider
// ########################################[ current version ]########################################
class Productst extends AsyncNotifier<List<ProductModel>> {
  @override
  FutureOr<List<ProductModel>> build() async {
    return fetchProduct();
  }

  Future<List<ProductModel>> fetchProduct() async {
    state = const AsyncLoading();
    late final List<ProductModel> result;
    try {
      state = await AsyncValue.guard(() async {
        final productlist =
            await ref.read(productRepositoryProvider).fetchProduct();
        result = productlist;
        return productlist;
      });
      if (result.isNotEmpty) {
        return result;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception();
    }
  }
}

final productProviders = AsyncNotifierProvider<Productst, List<ProductModel>>(
  () => Productst(),
);
