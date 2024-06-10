import 'package:flutter/material.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';
import 'package:lookchin_app/utils/thai_date.dart';

class TestDate extends StatefulWidget {
  const TestDate({super.key});

  @override
  State<TestDate> createState() => _TestDateState();
}

class _TestDateState extends State<TestDate> {
  String dateDefault = DateTime.now().toString();
  String dateuseTime = DateTime.now().toString();

  String shortDefault = DateTime.now().toString();
  String shortuseTime = DateTime.now().toString();

  String shorterDefault = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: ZimpleWidgets.zText("Date")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZimpleWidgets.zText(dateDefault),
              ZimpleWidgets.zText(dateuseTime),
              ZimpleWidgets.zText(shortDefault),
              ZimpleWidgets.zText(shortuseTime),
              ZimpleWidgets.zText(shorterDefault),
              vertical(30),
              ZimpleWidgets.zTextButton("Change to Thai Date", onPressed: () {
                setState(() {
                  dateDefault = dateTimeToString(DateTime.now());
                  dateuseTime = dateTimeToString(DateTime.now(), useTime: true);
                  shortDefault = dateTimeToString(DateTime.now(), short: true);
                  shortuseTime = dateTimeToString(
                    DateTime.now(),
                    short: true,
                    useTime: true,
                  );
                  shorterDefault =dateTimeToString(DateTime.now(), shorter: true);
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}

String dateTimeToString(
  DateTime dateTime, {
  bool short = false,
  bool shorter = false,
  bool useTime = false,
}) {
  var date = dateTime.day;
  var month = dateTime.month;
  var year = dateTime.year;
  var hour = dateTime.hour;
  var minute = dateTime.minute;

  //พศ ปี
  var thaiYear = year + 543;
  // เดือน
  var thaiMonth = short || shorter
      ? ShortThaimonth.allMonth[month - 1]
      : FullThaimonth.allMonth[month - 1];

  if (useTime) {
    if (short) return "$date $thaiMonth $thaiYear $hour : $minute น.";
    if (shorter) return "$date $thaiMonth ${thaiYear % 100} $hour : $minute น.";
    return "$date $thaiMonth $thaiYear $hour : $minute น.";
  } else {
    if (short) return "$date $thaiMonth $thaiYear";
    if (shorter) return "$date $thaiMonth ${thaiYear % 100} ";
    return "$date $thaiMonth $thaiYear";
  }

}
