import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowCategoly extends StatelessWidget {
  const ShowCategoly({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listCat = [
      "ทั้งหมด",
      "อาหาร",
      "ภาพยนต์",
      "คาเฟ่",
      "ความงาม",
      "เสื้อผ้าผู้หญิง",
      "เสื้อผ้าผู้ชาย",
    ];

    return SizedBox(
      height: 1.sh * 0.05,
      child: ListView.builder(
        padding:  EdgeInsets.only(left: 20.r),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listCat.length,
          itemBuilder: (context, index) {
            return TextButton(onPressed: (){},child: Text(listCat[index]),);
          }),
    );
  }
}
