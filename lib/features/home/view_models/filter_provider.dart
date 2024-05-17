import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/features/home/models/product_model.dart';

class FilterProduct extends StateNotifier<Category> {
  FilterProduct() : super(Category.all);

  void changeFilter(Category newCat) {
    state = newCat;
  }
}

final filterProductProvider = StateNotifierProvider<FilterProduct, Category>((ref) => FilterProduct());
