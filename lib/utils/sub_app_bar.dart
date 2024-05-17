import 'package:flutter/material.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../../utils/Util.dart';

enum LeadingType { noButton, useBack, useClose }

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actionButton;
  final String? title;
  final bool useBack;
  final LeadingType leadingType;
  final VoidCallback? leadCallback;
  final Widget? leadingWidget;
  final Color? backgroundColor;
  final Color? leadingColor;

  const SubAppBar(
      {Key? key,
      this.title,
      @deprecated this.useBack = true,
      this.actionButton,
      this.leadingType = LeadingType.useBack,
      this.leadCallback,
      this.backgroundColor,
      this.leadingWidget,
      this.leadingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: Util.deviceWidth(context),
      color: backgroundColor ?? Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF212123),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (leadingType != LeadingType.noButton && useBack) ...{
            Align(
              alignment: Alignment.centerLeft,
              child: leadingWidget ??
                  IconButton(
                    icon: ZimpleWidgets.zSvgImage(
                        leadingType == LeadingType.useBack
                            ? 'topbar_ico_arrow-left'
                            : 'topbar_ico_close-square',
                        // colorFilter: ColorFilter.mode(
                        //     leadingColor ?? AppColors.primaryTextColor,
                        //     BlendMode.srcIn),
                        colorFilter: ColorFilter.mode(
                            leadingColor ?? Colors.blue, BlendMode.srcIn),
                        width: 24,
                        height: 24),
                    onPressed: leadCallback ??
                        () {
                          Navigator.maybePop(context);
                        },
                  ),
            ),
          },
          PositionedDirectional(
            end: 1,
            child: Row(
              children: actionButton ?? [],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(46);
}
