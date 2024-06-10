import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class TestLookChin extends StatefulWidget {
  const TestLookChin({super.key});

  @override
  State<TestLookChin> createState() => _TestDateState();
}

class _TestDateState extends State<TestLookChin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: ZimpleWidgets.zText("LookChin")),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            color: Colors.greenAccent.shade100,
            child: Lookchin(),
          ),
        ),
      ),
    );
  }
}

class Lookchin extends StatelessWidget {
  const Lookchin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if(1.sw < 430.0){
       return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(
          thickness: 5,
          color: Colors.brown,
        ),
        Positioned(
          left: 20.w,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 85.w,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 150.w,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 215.w,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 279.w,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Column(
          children: [
            ZimpleWidgets.zText(1.sw.toString()),
            ZimpleWidgets.zText(1.sh.toString())
          ],
        )
      ],
    );
    }else{
 return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(
          thickness: 7,
          color: Colors.brown,
        ),
        Positioned(
          left: 20,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 110,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 310,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Positioned(
          left: 210,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.amber,
          ),
        ),
        Column(
          children: [
            ZimpleWidgets.zText(1.sw.toString()),
            ZimpleWidgets.zText(1.sh.toString())
          ],
        )
      ],
    );
    }
   
  }
}
