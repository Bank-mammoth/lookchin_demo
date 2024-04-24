import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../../constants/constants.dart';
import '../../home/views/widgets/error_product.dart';
import '../view_models/search_provider.dart';
import 'customrow.dart';

class SearchEmpty extends ConsumerStatefulWidget {
  const SearchEmpty({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchEmptyState();
}

class _SearchEmptyState extends ConsumerState<SearchEmpty> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final recentData = ref.watch(recentSearchProvider);
    return recentData.when(
      data: (data) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data!.isNotEmpty)
                  ZimpleWidgets.zText("Recent", useBold: true),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: isExpanded ? data.length : min(3, data.length),
                    itemBuilder: (context, index) {
                      return CustomRow(
                        hearder: data[index].recentName,
                        untap: () {
                          ref
                              .read(recentSearchProvider.notifier)
                              .removeRecent(id: data[index].id);
                        },
                        ontap: () {},
                      );
                    }),
                if (data.length > 3) ...[
                  vertical(10),
                  Center(
                    child: ZimpleWidgets.zTextButton("See More",
                        width: 1.sw * 0.8, onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    }),
                  ),
                ],
                vertical(10),
                ZimpleWidgets.zText("Trending Searches", useBold: true),
                CustomRow(
                    useIcon: true, hearder: "ร้านอาหารใกล้ฉัน", ontap: () {}),
                CustomRow(useIcon: true, hearder: "คาเฟ่ลับ", ontap: () {}),
                CustomRow(useIcon: true, hearder: "ถนนชำรุด", ontap: () {}),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Expanded(child: ErrorProduct(error: error));
      },
      loading: () => const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


