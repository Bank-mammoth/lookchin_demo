import 'package:flutter/material.dart'; 

import '../../../constants/constants.dart';
import '../../../utils/simple_widgets.dart';

class CustomRow extends StatelessWidget {
  final String hearder;
  final bool? useIcon;
  final VoidCallback? untap;
  final VoidCallback? ontap;
  const CustomRow({
    super.key,
    required this.hearder,
    this.useIcon = false,
    this.untap,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: useIcon ?? false
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          if (useIcon ?? false) ...[
            const Icon(
              Icons.search,
              color: Colors.grey,
              size: 18,
            ),
            horizontal(10)
          ],
          ZimpleWidgets.zText(
            hearder,
            fontSize: FontSize.bodySmall,
            color: colorGrey,
          ),
          if (untap != null)
            GestureDetector(
              onTap: untap,
              child: ZimpleWidgets.zText(
                "x",
                fontSize: FontSize.bodySmall,
              ),
            )
        ],
      ),
    );
  }
}
