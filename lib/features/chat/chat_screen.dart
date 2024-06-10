import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/list_chat/models/list_chat_model.dart';
import 'package:lookchin_app/features/list_chat/widgets/list_chat_all_screen.dart';
import 'package:lookchin_app/utils/custom_textfield.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "chat";
  final ChatListModel chatItem;
  const ChatScreen({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ZimpleWidgets.zText(chatItem.title, useBold: true),
        actions: [
          IconButton(
              onPressed: () {
                showLeaveChat(context);
              },
              icon: const Icon(Icons.more_horiz_outlined))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _productBanner(),
            const Divider(
              thickness: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: ZimpleWidgets.zText("Jul 14, 2023"),
                  ),
                  ScrollablePositionedList.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    initialScrollIndex: 0,
                    itemBuilder: (context, index) {
                      return Container(
                        child: const Text('ii'),
                      );
                    },
                  )
                ],
              ),
            ),
            // IntrinsicHeight(
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                 Expanded(
                    child: CustomTextField(
                      height: 40.h,
                  hintText: "Messages...",
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            ),
            vertical(20)
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> showLeaveChat(BuildContext context) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const Text('Title'),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              ZimpleWidgets.zShowDialogTwoButton(
                  context: context,
                  title:
                      "All conversation content will be delete. Would you like to leave the chat room ?",
                  btSaveTitle: "Lave Chat",
                  onSavePressed: () {
                    context.pop();
                    context.pop();
                    context.pop();
                  });
              // Navigator.pop(context);
              // context.pop();
            },
            child: const Text('Leave Chat'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Container _productBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildItemProductImage(
            width: 70.w,
            height: 70.h,
            item: chatItem,
          ),
          horizontal(12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZimpleWidgets.zText("สินค้าคุณภาพดี สภาพ 99%"),
                ZimpleWidgets.zText("\$ 2,100"),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 45.h,
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 5, top: 8.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // child: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     ZimpleWidgets.zText("Active"),
                    //     const Icon(Icons.arrow_drop_down)
                    //   ],
                    // ),
                    child: DropdownButton<String>(
                      value: "Active",
                      onChanged: (String? newValue) {
                        // setState(() {
                        //   _selectedItem = newValue!;
                        // });
                      },
                      
                      items: <String>['Active', 'Reserved', 'Sold']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline:
                          const SizedBox(), // Remove the default underline
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
