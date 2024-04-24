

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/simple_widgets.dart';

class DescriptionProduct extends StatelessWidget {
  const DescriptionProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      width: 1.sw,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZimpleWidgets.zText("Product Name",
              fontSize: FontSize.headline, useBold: true),
          ZimpleWidgets.zText("\$ 450,000",
              fontSize: FontSize.headline, useBold: true),
          ZimpleWidgets.zText("Item Name (Brand)Purchase DateItem Condition (ex. Excellent/Good/Fair/Poor)Usage Signs Minimal/Slight/Noticeable)Defects (None/Present)"),
        ],
      ),
    );
  }
}
