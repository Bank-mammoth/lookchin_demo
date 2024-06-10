import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lookchin_app/common/main_nav_screen.dart';
import 'package:lookchin_app/features/auth/auth_screen.dart';
import 'package:lookchin_app/features/chat/chat_screen.dart';
import 'package:lookchin_app/features/detail_product/view/detail_product_page.dart';
import 'package:lookchin_app/features/list_chat/list_chat_screen.dart';
import 'package:lookchin_app/features/list_chat/models/list_chat_model.dart';
import 'package:lookchin_app/features/onboard/onboarding_screen.dart';
import 'package:lookchin_app/features/product_add/product_add_screen.dart';
import 'package:lookchin_app/features/profile_detail/profile_detail_screen.dart';
import 'package:lookchin_app/features/setting_screen/setting_screen.dart';
import 'package:lookchin_app/langauge/langauge_screen.dart';
import 'package:lookchin_app/splase_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'features/search/search_page.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

final appRouter = Provider((ref) {
  return GoRouter(
    initialLocation: "/splash",
    navigatorKey: rootNavKey,
    routes: <GoRoute>[
      GoRoute(
          path: "/splash",
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: "/onboard",
          name: OnboarddingScreen.routeName,
          builder: (context, state) => const OnboarddingScreen()),
      GoRoute(
          path: "/authen",
          name: AuthenScreen.routeName,
          builder: (context, state) => const AuthenScreen()),
      GoRoute(
        path: "/tab/:tab",
        name: MainNavScreen.routeName,
        builder: (context, state) {
          final tab = state.pathParameters["tab"].toString();
          return MainNavScreen(tab: tab);
        },
      ),
      GoRoute(
          path: "/detailproduct",
          name: DetailProductPage.routeName,
          builder: (context, state) => const DetailProductPage()),
      GoRoute(
          path: "/search",
          name: SearchPage.routeName,
          builder: (context, state) => const SearchPage()),
      GoRoute(
          path: "/listchat",
          name: ListChatScreen.routeName,
          builder: (context, state) => const ListChatScreen()),
      GoRoute(
          path: "/productadd",
          name: ProductAddScreen.routeName,
          builder: (context, state) => const ProductAddScreen()),
      GoRoute(
          path: "/setting",
          name: SettingScreen.routeName,
          builder: (context, state) => const SettingScreen()),
      GoRoute(
          path: "/chat",
          name: ChatScreen.routeName,
          builder: (context, state) {
            final ChatListModel chatItem = state.extra as ChatListModel;
            return  ChatScreen(
               chatItem: chatItem,);
          }),
       GoRoute(
          path: "/profiledetail",
          name: ProfileDetailScreen.routeName,
          builder: (context, state) => const ProfileDetailScreen()),
      GoRoute(
          path: "/language",
          name: LanguageScreen.routeName,
          builder: (context, state) => const LanguageScreen()),
    ],
  );
});
