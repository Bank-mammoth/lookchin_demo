import 'package:flutter/material.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../community/widgets/show_botton_Sheet.dart';

class RecommendeScreen extends StatelessWidget {
  const RecommendeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ZimpleWidgets.zTextButton("Choose Address",
              onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ShowBottonSheet(),
                  )),
        ),
      ),
    );
  }
}
