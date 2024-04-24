import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/features/home/models/product_model.dart';
import 'package:lookchin_app/features/search/search_page.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../../constants/constants.dart';
import '../view_models/product_provider.dart';
import 'widgets/error_product.dart';
import 'widgets/show_product.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        // เรียกใช้ fetchProduct() และ listen การเปลี่ยนแปลงของ state
        ref.watch(productProvider.notifier).fetchProduct();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // รับข้อมูลผลลัพธ์จาก provider
    final productState = ref.watch(productProvider);

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
                    const Icon(Icons.chat)
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SearchBarCustom(
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  ),
              readOnly: true),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ZimpleWidgets.zText(
              "For you",
              useBold: true,
            ),
            ZimpleWidgets.zText("Popular"),
            ZimpleWidgets.zText("Exchange"),
            ZimpleWidgets.zText("For you"),
            ZimpleWidgets.zText(">"),
          ],
        ),
        vertical(15),
        Expanded(
            child: 
                Center(
              child: productState.when(
                data: (List<ProductModel>? data) {
                  if (data == null || data.isEmpty) {
                    return  Center(
                      child: ZimpleWidgets.zText('Data is Null'),
                    );
                  }
                  return ShowProduct(data: data);
                },
                error: (error, stackTrace) {
                  return ErrorProduct(error: error);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
            ),
      ],
    ));
  }
}
