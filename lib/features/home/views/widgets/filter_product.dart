import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/features/home/models/product_model.dart';

import '../../../../utils/simple_widgets.dart';
import '../../view_models/filter_provider.dart';

class FilterProductScreen extends StatelessWidget {
  const FilterProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 30,
      runSpacing: 5,
      children: [
        FilterButton(filter: Category.all),
        FilterButton(filter: Category.menClothing),
        FilterButton(filter: Category.womenClothing),
        FilterButton(filter: Category.jewelery),
        FilterButton(filter: Category.electronics),
      ],
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
