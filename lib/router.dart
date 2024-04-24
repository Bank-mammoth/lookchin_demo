import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lookchin_app/common/main_nav_screen.dart';
import 'package:lookchin_app/features/detail_product/view/detail_product_page.dart';
import 'package:lookchin_app/splase_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/home/view_models/product_provider.dart';
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
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: "/search",
        name: SearchPage.routeName,
        builder: (context, state) {
          return const SearchPage();
        },
      ),
      GoRoute(
          path: "/tab/:tab",
          name: MainNavScreen.routeName,
          builder: (context, state) {
         
            final tab = state.pathParameters["tab"].toString();

            return MainNavScreen(tab: tab);
          },
          routes: <GoRoute>[
            GoRoute(
              path: "detailproduct",
              name: DetailProductPage.routeName,
              builder: (context, state) {

                return const DetailProductPage();
              },
            ),
          ]),
    ],
  );
});
