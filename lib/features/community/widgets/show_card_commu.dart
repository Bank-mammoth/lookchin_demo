import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/community/models/models_commu.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class ShowCardCommu extends StatelessWidget {
  const ShowCardCommu({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommuModel> listCard = [
      CommuModel(
          userName: "Peter00",
          level: 25,
          status: "วันนี้กินอะไรดี",
          postAt: "10 minutes ago",
          like: 2,
          comment: 6,
          image: null),
      CommuModel(
          userName: "khunchaipee",
          level: 30,
          status: "รบกวนแนะนำร้านตัดสูท สำหรับงานแต่งงานหน่อยครับ",
          postAt: "10 minutes ago",
          like: 2,
          comment: 6,
          image: null),
      CommuModel(
        userName: "Wannn",
        level: 44,
        status: "รีวิวร้านอาหารตามสั่ง ทุกอย่าง 50บาท ใกล้ถนน...",
        postAt: "10 minutes ago",
        like: 2,
        comment: 6,
        image:
            "https://static.thairath.co.th/media/dFQROr7oWzulq5Fa5Bt2BRYQD5bNQo0gqyb4Kf3En5A5aUGXmezWogGtIWFTaRRilQX.webp",
      ),
      CommuModel(
        userName: "jennie.spot",
        level: 60,
        status: "แชร์วิธีล้างแอร์ด้วยตัวเอง อยู่บ้านคนเดียวก็ทำได้",
        postAt: "10 minutes ago",
        like: 2,
        comment: 6,
        image:
            "https://s359.kapook.com//pagebuilder/56859c3b-c721-49a6-8130-f8330336cff3.jpg",
      ),
      CommuModel(
          userName: "Fahsai",
          level: 25,
          status: "แนะนำร้านส้มตำอีสานแท้หน่อยค่าทุกคนน",
          postAt: "10 minutes ago",
          like: 2,
          comment: 6,
          image: null),
    ];
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: colorWhite),
        shrinkWrap: true,
        itemCount: listCard.length + 1,
        itemBuilder: (context, index) {
          if (index == listCard.length) {
            return const Padding(
                padding: EdgeInsets.all(8.0), child: SizedBox());
          } else {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10.sp),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (listCard[index].image != null)
                        Container(
                          width: 100.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            listCard[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      horizontal(10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ZimpleWidgets.zText(listCard[index].userName!,
                                  useBold: true),
                              ZimpleWidgets.zText(
                                  " Lv.${listCard[index].level.toString()}"),
                            ],
                          ),
                          vertical(5),
                          ZimpleWidgets.zText(listCard[index].status!,
                              fontSize: FontSize.titleSmall,
                              useBold: true),
                          vertical(5),
                          Row(
                            children: [
                              ZimpleWidgets.zText(listCard[index].postAt!,
                                  fontSize: FontSize.body),
                              const Text(" | "),
                              Icon(
                                Icons.favorite_outline_rounded,
                                size: FontSize.titleSmall,
                              ),
                              ZimpleWidgets.zText(
                                  listCard[index].like.toString(),fontSize: FontSize.body),
                                  horizontal(5),
                              Icon(
                                Icons.comment,
                                size: FontSize.titleSmall,
                              ),
                              ZimpleWidgets.zText(
                                  listCard[index].comment.toString(),fontSize: FontSize.body),
                            ],
                          )
                        ],
                      )),
                      const Icon(Icons.more_horiz)
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
