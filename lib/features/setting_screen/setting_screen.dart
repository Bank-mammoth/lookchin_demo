import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/auth/auth_screen.dart';
import 'package:lookchin_app/features/setting_screen/models/carditem_mode.dart';
import 'package:lookchin_app/features/setting_screen/widgets/build_card_item.dart';
import 'package:lookchin_app/langauge/langauge_screen.dart';
import 'package:lookchin_app/langauge/view_models/langauge_provider.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "setting";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorWhite,
          centerTitle: true,
          title: ZimpleWidgets.zText(lang.setting_setting,
              fontSize: FontSize.title, useBold: true)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildCardSetting(
              title: lang.setting_noti,
              listCard: [
                CardItem(
                    titlecard: lang.setting_noti,
                    icon: const Icon(Icons.notifications_none_outlined),
                    onTap: () {}),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final currentlang = ref.watch(languageProvider);
                return BuildCardSetting(
                  title: lang.setting_usersetting,
                  listCard: [
                    CardItem(
                        titlecard: lang.setting_country,
                        icon: const Icon(Icons.language),
                        onTap: () {}),
                    CardItem(
                        titlecard: lang.setting_language,
                        icon: const Icon(Icons.wordpress_outlined),
                        suffixText: currentlang.name == "en" ? "Eng" : "Thai",
                        onTap: () =>
                            context.pushNamed(LanguageScreen.routeName)),
                    CardItem(
                        titlecard: lang.setting_theme,
                        icon: const Icon(Icons.blur_circular_rounded),
                        onTap: () {}),
                  ],
                );
              },
            ),
            BuildCardSetting(
              title: lang.setting_infoandsupport,
              listCard: [
                CardItem(
                    titlecard: "What's new?",
                    icon: const Icon(Icons.info_outline_rounded),
                    onTap: () {}),
                CardItem(
                    titlecard: lang.setting_help,
                    icon: const Icon(Icons.help_outline_rounded),
                    onTap: () {}),
                CardItem(
                    titlecard: lang.setting_terms,
                    icon: const Icon(Icons.person_search_rounded),
                    onTap: () {}),
                CardItem(
                    titlecard: lang.setting_policy,
                    icon: const Icon(Icons.privacy_tip_outlined),
                    onTap: () {}),
                CardItem(
                    titlecard: lang.setting_locationterms,
                    icon: const Icon(Icons.my_location_outlined),
                    onTap: () {}),
                CardItem(
                    titlecard: lang.setting_version,
                    icon: const Icon(Icons.file_copy),
                    suffixText: "1.0.0(1)",
                    onTap: () => ZimpleWidgets.zShowDialogOneButton(
                        context: context,
                        title: "You are currently using the \n lastest version",
                        fontSize: FontSize.headline,
                        buttonTitle: "Confirm")),
              ],
            ),
            BuildCardSetting(
              useDivider: false,
              listCard: [
                CardItem(
                    titlecard:lang.setting_logout,
                    icon: const Icon(Icons.logout_outlined),
                    onTap: () {
                      ZimpleWidgets.zShowDialogTwoButton(
                          backgroundColor: colorWhite,
                          context: context,
                          title: "Log out",
                          content: "Are tour sure you want to log out?",
                          titleBold: true,
                          fontSize: FontSize.headline,
                          btSaveTitle: "Log out",
                          onSavePressed: () {
                            logOut().then((value) =>
                                context.goNamed(AuthenScreen.routeName));
                          });
                    }),
                CardItem(
                    titlecard: lang.setting_deleteac,
                    icon: const Icon(Icons.person_off),
                    onTap: () {
                      debugPrint("Delete Account");
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Preference.loggedin, false);
  }
}
