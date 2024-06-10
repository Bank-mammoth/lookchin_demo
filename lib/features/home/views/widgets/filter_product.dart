import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/home/models/product_model.dart';

import '../../../../utils/simple_widgets.dart';
import '../../view_models/filter_provider.dart';

class FilterProductScreen extends StatelessWidget {
  const FilterProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List listCat = [
      const FilterButton(filter: Category.all),
      const FilterButton(filter: Category.menClothing),
      const FilterButton(filter: Category.womenClothing),
      const FilterButton(filter: Category.jewelery),
      const FilterButton(filter: Category.electronics),
    ];

    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        padding:  EdgeInsets.only(right: 20.sp),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listCat.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                horizontal(20),
                listCat[index],
              ],
            );
          })
    );
  }
}

class FilterButton extends ConsumerWidget {
  const FilterButton({
    super.key,
    required this.filter,
  });

  final Category filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(filterProductProvider);
    return GestureDetector(
      onTap: () {
        ref.read(filterProductProvider.notifier).changeFilter(filter);
      },
      child: ZimpleWidgets.zText(filter.name,
          useBold: current == filter ? true : false,
          color: current == filter ? Colors.blue : Colors.grey),
    );
  }
}
