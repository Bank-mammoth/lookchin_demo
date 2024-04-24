import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/simple_widgets.dart';
import '../../view_models/product_provider.dart';

class ErrorProduct extends ConsumerWidget {
  final Object? error;
  const ErrorProduct({super.key, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZimpleWidgets.zText(error.toString()),
          SizedBox(height: 20.h),
          OutlinedButton(
              onPressed: () {
                ref.watch(productProvider.notifier).fetchProduct();
              },
              child: ZimpleWidgets.zText('Please Retry!'))
        ],
      ),
    );
  }
}
