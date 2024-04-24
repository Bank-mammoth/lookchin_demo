

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/simple_widgets.dart';

class ShowCardUser extends ConsumerWidget {
  const ShowCardUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 1.sw,
      height: 0.1.sh,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'images/user1.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: 10.r,top: 8.r),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ZimpleWidgets.zText("User name",
                        fontSize: FontSize.body, useBold: true),
                    ZimpleWidgets.zText("rating user : *****",
                        fontSize: FontSize.bodySmall),
                    ZimpleWidgets.zText("1 h ago ", fontSize: FontSize.bodySmall),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Icon(Icons.remove_red_eye_outlined,size: 15.r,color: colorGrey),
                          ZimpleWidgets.zText("456", fontSize: FontSize.title,color: colorGrey),
                          horizontal(10),
                           Icon(Icons.favorite_border,size: 15.r,color: colorGrey,),
                          ZimpleWidgets.zText("12", fontSize: FontSize.title,color: colorGrey),
                           horizontal(10),
                           Icon(Icons.comment,size: 15.r,color: colorGrey),
                         ZimpleWidgets.zText("4", fontSize: FontSize.title,color: colorGrey),
                          horizontal(10),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
