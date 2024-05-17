import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/features/list_chat/models/list_chat_model.dart';
import 'package:lookchin_app/features/list_chat/view_models/filter_chatlist.dart';

import '../../../utils/simple_widgets.dart';

class FilterChat extends StatelessWidget {
  const FilterChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 50.h,
      // color: Colors.amber.withOpacity(0.5),
      child: const Row(
        children: [
          FilterButton(
            title: "All",
            filter: StatusUser.all,
          ),
            FilterButton(
            title: "Buyer",
            filter: StatusUser.buyer,
          ),
            FilterButton(
            title: "Seller",
            filter: StatusUser.seller,
          ),
        ],
      ),
    );
  }
}

class FilterButton extends ConsumerWidget {
  final StatusUser filter;
  final String title;
  const FilterButton({super.key, required this.filter, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(filterChatListProvider);
    return Expanded(
        child: InkWell(
      onTap: () => ref.read(filterChatListProvider.notifier).changeFilter(filter),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ZimpleWidgets.zText(title),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 2,
                color: currentFilter == filter ? Colors.black : null,
              ))
        ],
      ),
    ));
  }
}
