import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class BottonSheetChooseCountry extends ConsumerWidget {
  const BottonSheetChooseCountry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return DraggableScrollableSheet(
    //   builder: (context, scrollController) {
    //     return Container(
    //       color: Colors.amber,
    //       child: ListView.builder(
    //         controller: scrollController,
    //         itemCount: 4,
    //         itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text('Item $index'),
    //         );
    //       },),
    //     );
    //   },
    // );
    return Container(
      height: 1.sh * 0.3,
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 20.r),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
        ZimpleWidgets.zText('Select current country',useBold: true),
        vertical(25),
        ZimpleWidgets.zInkButton(
          height: 20,
           padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.circle),
              horizontal(5),
              ZimpleWidgets.zText("Thailand")
            ],
          ),
          onTap: (){
            print('Click');
            Navigator.pop(context);
          }
        )
        ],
      ),
    );
  }
}
