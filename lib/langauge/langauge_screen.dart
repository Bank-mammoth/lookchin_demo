import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/langauge/view_models/langauge_provider.dart';
import 'package:lookchin_app/langauge/view_models/langauge_type.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

import '../generated/l10n.dart';

class LanguageScreen extends ConsumerWidget {
  static const routeName = 'language';
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentlang = ref.watch(languageProvider);
    final lang = S.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ZimpleWidgets.zText(lang.setting_language),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
        child: Column(
          children: [
            buildButton(
                "English",
                currentlang,
                'en',
                () => ref
                    .read(languageProvider.notifier)
                    .toggleLanguage(EngType())),
            const Divider(color: Colors.grey),
            buildButton(
                "Thai",
                currentlang,
                'th',
                () => ref
                    .read(languageProvider.notifier)
                    .toggleLanguage(ThaiType())),
          ],
        ),
      ),
    );
  }

  Row buildButton(
    String title,
    LanguageType currentype,
    String lang,
    VoidCallback onPressed,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ZimpleWidgets.zText(title, fontSize: FontSize.title),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.check_circle,
              color: currentype.name == lang ? Colors.blue : Colors.grey,
            ))
      ],
    );
  }
}
