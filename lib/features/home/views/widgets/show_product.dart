import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/home/view_models/product_provider.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../models/product_model.dart';

class ShowProduct extends ConsumerWidget {
  final List<ProductModel> data;
  const ShowProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.watch(productProviders.notifier).fetchProduct();
          // ref.watch(productProvider.notifier).fetchProduct();
        },
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 10.w),
          itemCount: data.length + 1,
          itemBuilder: (context, index) {

            if (index == data.length) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ZimpleWidgets.zText(' --- End of the list ---'),
                ),
              );
            } else {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  // Example navigation command
                  context.push('/detailproduct');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 100.w,
                        height: 90.h,
                        child: Image.network(data[index].image)),
                    horizontal(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ZimpleWidgets.zText(data[index].title),
                          vertical(50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ZimpleWidgets.zText(
                                  "\$${data[index].price.toString()}",
                                  useBold: true,
                                  fontSize: FontSize.headline),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 15.sp,
                                    color: Colors.grey,
                                  ),
                                  ZimpleWidgets.zText("10",
                                      fontSize: 12, color: colorGrey),
                                  horizontal(5),
                                  Icon(Icons.comment_bank,
                                      size: 15.sp, color: Colors.grey),
                                  ZimpleWidgets.zText("10",
                                      fontSize: 12, color: colorGrey),
                                  horizontal(5),
                                  Icon(Icons.remove_red_eye_outlined,
                                      size: 15.sp, color: Colors.grey),
                                  ZimpleWidgets.zText("1.2k",
                                      fontSize: 12, color: colorGrey),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          separatorBuilder: (context, index) => const Divider(
            endIndent: 18,
            indent: 18,
            thickness: 0.25,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
