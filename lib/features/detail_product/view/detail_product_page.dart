
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/features/detail_product/view/widgets/description_product.dart';
import 'package:lookchin_app/features/detail_product/view/widgets/show_card_user.dart';
import 'package:lookchin_app/features/detail_product/view/widgets/show_image.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../../constants/constants.dart';


class DetailProductPage extends StatefulWidget {
  static const routeName = "detailProduct";
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ZimpleWidgets.arrowback(onTap: () {
                  print(Navigator.canPop(context));
                  Navigator.pop(context);
                }),
                const Spacer(),
                const Icon(Icons.more_horiz_outlined),
                horizontal(20)
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  const ShowImage(),
                  const ShowCardUser(),
                  const Expanded(child: DescriptionProduct()),
                  ZimpleWidgets.zTextButton("Chat",
                      width: 0.7.sw,
                      backgroundColor: colorBlack,
                      textColor: colorWhite,
                      useBold: true,
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
