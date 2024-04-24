
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/provider/product_service_provider.dart';
import '../products_repository.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProducstRepository productRepository(ProductRepositoryRef ref) {
  return ProducstRepository(
      productApiService: ref.watch(productApiServiceProvider));
}
