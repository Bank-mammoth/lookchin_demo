import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/list_chat/widgets/filter_list_chat.dart';
import 'package:lookchin_app/features/list_chat/widgets/list_chat_all_screen.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';


class ListChatScreen extends ConsumerWidget {
  static const routeName = "listchat";
  const ListChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ZimpleWidgets.zText("Chat",
            useBold: true, fontSize: FontSize.title),
      ),
      body: const Column(
        children: [
          FilterChat(),
          ListChat(),
        ],
      ),
    );
  }
}
