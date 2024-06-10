import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/features/home/models/product_model.dart';
import 'package:lookchin_app/features/home/view_models/filter_provider.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../../constants/constants.dart';
import '../view_models/product_provider.dart';
import 'widgets/error_product.dart';
import 'widgets/filter_product.dart';
import 'widgets/show_product.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(child: Container(width: 1.w)),
                Expanded(
                  child: Center(
                    child: ZimpleWidgets.zText(
                      "LOOKCHIN",
                      useBold: true,
                      fontSize: FontSize.headline,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.notifications),
                      SizedBox(width: 10.w),
                      GestureDetector(
                          onTap: () {
                            context.push('/listchat');
                          },
                          child: const Icon(Icons.chat))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SearchBarCustom(
              onTap: () => context.push("/search"),
              readOnly: true,
            ),
          ),
          const FilterProductScreen(),
          vertical(15),
          Expanded(
            child: Center(
              child: ref.watch(productProviders).when(
                    data: (List<ProductModel>? data) {
                      if (data == null || data.isEmpty) {
                        return Center(
                          child: ZimpleWidgets.zText('Data is Null'),
                        );
                      }
                      List<ProductModel> filter = filterData(data);
                      return ShowProduct(data: filter);
                    },
                    error: (error, stackTrace) {
                      return ErrorProduct(error: error);
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              //older version
              // child: productState.when(
              //   data: (List<ProductModel>? data) {
              //     if (data == null || data.isEmpty) {
              //       return  Center(
              //         child: ZimpleWidgets.zText('Data is Null'),
              //       );
              //     }
              //     return ShowProduct(data: data);
              //   },
              //   error: (error, stackTrace) {
              //     return ErrorProduct(error: error);
              //   },
              //   loading: () => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorBlack,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
        onPressed: () {
         context.push('/productadd');
        },
        child: const Icon(
          Icons.add,
          color: colorWhite,
        ),
      ),
    );
  }

  List<ProductModel> filterData(List<ProductModel> data) {
    final filter = ref.watch(filterProductProvider);

    List<ProductModel> filteredData;
    if (filter == Category.all) {
      filteredData = data;
    } else {
      filteredData = data.where((element) {
        final categoryEnum = categoryFromString(element.category);
        return categoryEnum == filter;
      }).toList();
    }

    return filteredData;
  }

  Category? categoryFromString(String categoryString) {
    switch (categoryString.toLowerCase()) {
      case "men's clothing":
        return Category.menClothing;
      case "jewelery":
        return Category.jewelery;
      case "electronics":
        return Category.electronics;
      case "women's clothing":
        return Category.womenClothing;
      default:
        return null;
    }
  }
}
