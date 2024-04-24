import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../constants/constants.dart';
import 'view_models/search_provider.dart';
import 'widgets/search_empty.dart';
import 'widgets/search_not_empty.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  static const routeName = "search";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  // final TextEditingController _textcontroll = TextEditingController();


  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(recentSearchProvider.notifier).fetchRecent();
    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
   final text =  ref.watch(searchItemProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ZimpleWidgets.arrowback(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SearchBarCustom(
                  // textcontroller: _textcontroll,
                  removeText: () {
                    ref.read(searchItemProvider.notifier).clearSearchTerm();
                  },
                  onChanged: (input){
                    ref.read(searchItemProvider.notifier).setSearchTerm(input);
                  },
                ),
              ],
            ),
            vertical(20),
            if (text.isEmpty)
              const SearchEmpty()
            else
              const SearchNotEmpty()
          ],
        ),
      ),
    );
  }
}

