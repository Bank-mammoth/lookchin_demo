import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/list_chat/models/list_chat_model.dart';
import 'package:lookchin_app/features/list_chat/view_models/fetch_chatlist.dart';
import 'package:lookchin_app/features/list_chat/view_models/filter_chatlist.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class ListChat extends ConsumerStatefulWidget {
  const ListChat({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListChatState();
}

class _ListChatState extends ConsumerState<ListChat> {
  @override
  Widget build(BuildContext context) {
    final fetchData = ref.watch(listChatItemProvider);
    return Expanded(
      child: fetchData.when(
        data: (data) {
          List<ChatListModel> filter = fiterItemChat(data);
          return ListView.separated(
            itemCount: filter.length,
            itemBuilder: (context, index) {
              final item = filter[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.image),
                ),
                title: ZimpleWidgets.zText(item.title, useBold: true),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ZimpleWidgets.zText(item.location,
                            color: colorGrey, fontSize: FontSize.body),
                        ZimpleWidgets.zText(" | ",
                            color: colorGrey, fontSize: FontSize.body),
                        ZimpleWidgets.zText(item.time,
                            color: colorGrey, fontSize: FontSize.body),
                      ],
                    ),
                    checkStatusProduct(item.status!),
                    Text(
                      item.message,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
                trailing: BuildItemProductImage(item: item),
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: colorWhite,
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: ZimpleWidgets.zText("Somrthing was worng!!!"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  fiterItemChat(List<ChatListModel> data) {
    final filter = ref.watch(filterChatListProvider);

    List<ChatListModel> iTem;

    iTem = switch (filter) {
      StatusUser.buyer => data.where((element) => element.buyer == 0).toList(),
      StatusUser.seller => data.where((element) => element.buyer == 1).toList(),
      StatusUser.all => data,
    };

    return iTem;
  }

  checkStatusProduct(int status) {
    switch (status) {
      case 0 : return Container();
      case 1 : return Container(
      padding: EdgeInsets.all(2.sp), 
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2)),
      child: ZimpleWidgets.zText("Reseved",fontSize: FontSize.bodySmall));
      case 2 : return Container(
      padding: EdgeInsets.all(2.sp), 
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2)),
      child: ZimpleWidgets.zText("Sold",fontSize: FontSize.bodySmall));
    }
  }
}

class BuildItemProductImage extends StatelessWidget {
  const BuildItemProductImage({
    super.key,
    required this.item,
  });

  final ChatListModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: NetworkImage(item.productImag), fit: BoxFit.cover)),
      // child: Image.network(item.productImag),
    );
  }
}
