import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/setting_screen/models/carditem_mode.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class BuildCardSetting extends StatelessWidget {
  const BuildCardSetting({
    super.key,
    this.title,
    required this.listCard,
    this.useDivider = true,
  });

  final String? title;
  final List<CardItem> listCard;
  final bool? useDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if( title != null)ZimpleWidgets.zText(title!,
                    fontSize: FontSize.titleSmall, useBold: true),
             
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listCard.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: listCard[index].onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        listCard[index].icon,
                        horizontal(10),
                        ZimpleWidgets.zText(listCard[index].titlecard,
                            fontSize: FontSize.titleSmall),
                        if(listCard[index].suffixText != null)...[
                          const Spacer(),
                          ZimpleWidgets.zText(listCard[index].suffixText!,
                            fontSize: FontSize.body),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: useDivider??true,
          child: Divider(
            color: Colors.grey.shade200,
            thickness: 10.h,
          ),
        )
      ],
    );
  }
}
