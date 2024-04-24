// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/utils/debounce.dart';

import '../../home/views/widgets/error_product.dart';
import '../models/data_search_model.dart';
import '../view_models/search_provider.dart';
import 'customrow.dart';

class SearchNotEmpty extends ConsumerStatefulWidget {
  const SearchNotEmpty({super.key});

  @override
  _SearchNotEmptyState createState() => _SearchNotEmptyState();
}

class _SearchNotEmptyState extends ConsumerState<SearchNotEmpty> {
  final debounce = Debounce(millisecond: 650);

  @override
  void dispose() {
    debounce.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(searchDataProvider);
    ref.listen(searchItemProvider, (previous, next) {
      print(previous??next);
      debounce.run(() {
        ref.read(searchDataProvider.notifier).searchDataValue(search: previous??next);
      });
    });

    return searchData.when(
      data: (List<DataSearchModel>? data) {
        if (data != null && data.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CustomRow(
                  useIcon: true, hearder: data[index].searchName, ontap: () {});
            },
          );
        } else {
        return Container();
        }
      },
      error: (error, stackTrace) => Expanded(child: ErrorProduct(error: error)),
      loading: () => const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
