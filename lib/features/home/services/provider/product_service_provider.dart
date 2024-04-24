



import 'package:lookchin_app/features/home/services/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_service_provider.g.dart';

@riverpod
AppService productApiService(ProductApiServiceRef ref) {
  return AppService();
}