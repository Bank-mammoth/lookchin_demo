
import '../models/product_model.dart';
import '../services/service.dart';

class ProducstRepository {
  final AppService productApiService;

  ProducstRepository({required this.productApiService});

  Future<List<ProductModel>> fetchProduct() async {
    try {
      List<dynamic> dataValue = await productApiService.getDataFromAPI();
      final result = dataValue
          .map((productData) => ProductModel.fromMap(productData))
          .toList();
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
