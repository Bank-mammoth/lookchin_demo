import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider_pattern/res/components/common_popup.dart';
// import 'package:provider_pattern/models/model_county.dart';
// import 'package:provider_pattern/view/common/loading_screen.dart';
// import 'package:intl/intl.dart';

// import '../generated/l10n.dart';
// import '../res/constant/app_colors.dart';
// import '../../generated/l10n.dart';

class Util {
  static bool emailCheck(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static double deviceViewInsetsBottom(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String amountFormatInt(num amount) {
    return NumberFormat('###,###,###,###').format(amount);
  }

  static String amountFormat(num amount) {
    return NumberFormat('###,###,###,###.##').format(amount);
  }

  static Widget loadingWidget() {
    return Lottie.asset('assets/lottie_loading.json', width: 100, height: 100);
  }

  // static void showLoadingDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     // Prevent dialog from being dismissed by tapping outside
  //     builder: (BuildContext context) {
  //       return WillPopScope(
  //         onWillPop: () async => false,
  //         // Disable back button while dialog is open
  //         child: const LoadingScreen(),
  //       );
  //     },
  //   );
  // }

  static String diffDateTime(DateTime? writeTime) {
    if (writeTime != null) {
      DateTime currentTime = DateTime.now().toUtc();
      Duration difference = currentTime.difference(writeTime);
      if (difference.inDays > 0) {
        return '${difference.inDays}일 전';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}시간 전';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}분 전';
      } else {
        return '방금 전';
      }
    } else {
      return ' - ';
    }
  }

  static String diffDateString(String writeTime) {
    DateTime? time = DateTime.tryParse(writeTime);
    if (time != null) {
      DateTime currentTime = DateTime.now().toUtc();
      Duration difference = currentTime.difference(time);
      if (difference.inDays > 0) {
        return '${difference.inDays}일 전';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}시간 전';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}분 전';
      } else {
        return '방금 전';
      }
    } else {
      return writeTime;
    }
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(); // Close the dialog
  }

  static String timeStampToAmPm(int millSecond) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millSecond);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  static double sizeByPlatform({double android = 0, double ios = 0}) {
    return Platform.isIOS ? ios : android;
  }

  // static Widget listItemLoadingView(bool loading) {
  //   return loading
  //       ? Padding(
  //           padding: const EdgeInsets.only(top: 10, bottom: 40),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Container(
  //                   height: 90,
  //                   alignment: Alignment.center,
  //                   child: const CircularProgressIndicator(
  //                     color: AppColors.btnEnabledColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       : Container(height: 90);
  // }

  // static Future<bool> requestCameraPermission(
  //     {required BuildContext context}) async {
  //   // 권한 요청

  //   // Permission.camera.

  //   // var status1 = await Permission.camera.status;

  //   PermissionStatus status = await Permission.camera.request();

  //   if (status != PermissionStatus.permanentlyDenied) {
  //     // 결과 확인

  //     if (!status.isGranted) {
  //       // 허용이 안된 경우
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           // 권한없음을 다이얼로그로 알림
  //           return CommonPopup(
  //             alertKind: AlertKind.twoError,
  //             content: '권한 설정을 확인해주세요.',
  //             confirmName: '설정하기',
  //             confirm: () {
  //               openAppSettings(); // 앱 설정으로 이동
  //             },
  //             cancelName: '닫기',
  //           );
  //         },
  //       );
  //       return false;
  //     }
  //   }

  //   return true;
  // }

  // static CountryData amountLimitByCountryDouble(String country) {
  //   switch (country) {
  //     case 'sg':
  //       return CountryData(
  //           Nation: 'sg',
  //           amountMaxDouble: 99999.99,
  //           amountMaxString: "99,999.99",
  //           amountMinDouble: 1,
  //           amountMinString: "1",
  //           simbol: 'S\$');
  //     case 'vn':
  //       return CountryData(
  //           Nation: 'vn',
  //           amountMaxDouble: 999999999.99,
  //           amountMaxString: "999,999,999.99",
  //           amountMinDouble: 1000,
  //           amountMinString: "1,000",
  //           simbol: '₫');
  //     case 'th':
  //       return CountryData(
  //           Nation: 'th',
  //           amountMaxDouble: 9999999.99,
  //           amountMaxString: "9,999,999.99",
  //           amountMinDouble: 10,
  //           amountMinString: "10",
  //           simbol: '฿');
  //     case 'kr':
  //       return CountryData(
  //           Nation: 'kr',
  //           amountMaxDouble: 999999999.99,
  //           amountMaxString: "999,999,999.99",
  //           amountMinDouble: 10,
  //           amountMinString: "10",
  //           simbol: '₩');
  //     default:
  //       return CountryData(
  //           Nation: 'us',
  //           amountMaxDouble: 99999.99,
  //           amountMaxString: "99,999.99",
  //           amountMinDouble: 1,
  //           amountMinString: "1",
  //           simbol: '\$');
  //   }
  // }

  static String? validatePhoneNumber(String phoneNumber, String nation) {
    String errorMessage = "invalid phone number";
    if (phoneNumber.isEmpty) {
      return errorMessage;
    }

    if (nation == "us") {
      // 미국의 전화번호 유효성 검사 (숫자 10자리)
      final usPhoneNumberRegex = RegExp(r'^\d{10}$');
      if (!usPhoneNumberRegex.hasMatch(phoneNumber)) {
        return errorMessage;
      }
    } else if (nation == "sg") {
      // 싱가폴의 전화번호 유효성 검사 (숫자 8자리)
      final sgPhoneNumberRegex = RegExp(r'^\d{8}$');
      if (!sgPhoneNumberRegex.hasMatch(phoneNumber)) {
        return errorMessage;
      }
    } else if (nation == "kr") {
      // 한국의 전화번호 유효성 검사 (숫자 11자리)
      final krPhoneNumberRegex = RegExp(r'^\d{11}$');
      if (!krPhoneNumberRegex.hasMatch(phoneNumber)) {
        return errorMessage;
      }
    } else if (nation == "th") {
      // 태국의 전화번호 유효성 검사 (숫자 10자리)
      final twPhoneNumberRegex = RegExp(r'^\d{10}$');
      if (!twPhoneNumberRegex.hasMatch(phoneNumber)) {
        return errorMessage;
      }
    } else if (nation == "vn") {
      // 베트남의 전화번호 유효성 검사 (숫자 10자리)
      final vnPhoneNumberRegex = RegExp(r'^\d{10}$');
      if (!vnPhoneNumberRegex.hasMatch(phoneNumber)) {
        return errorMessage;
      }
    } else {
      errorMessage = "invalid country code";
      return "invalid country code";
    }

    return null;
  }

  static String getNationCode(String nation) {
    switch (nation) {
      case 'kr':
        return '+82';
      case 'us':
        return '+1';
      case 'sg':
        return '+65';
      case 'th':
        return '+66';
      case 'vn':
        return '+84';
      default:
        return '+1';
    }
  }

  static Map<String, dynamic>? decodeJwtToken(String jwtToken) {
    try {
      final Map<String, dynamic> decodedToken = json.decode(
        ascii.decode(base64.decode(base64.normalize(jwtToken.split('.')[1]))),
      );
      return decodedToken;
    } catch (e) {
      return null;
    }
  }

  static bool isTokenExpired(Map<String, dynamic> decodedToken) {
    try {
      if (decodedToken.containsKey('exp')) {
        final int expirationTimeInSeconds = decodedToken['exp'];
        final DateTime expirationDate =
            DateTime.fromMillisecondsSinceEpoch(expirationTimeInSeconds * 1000);

        final bool isExpired = DateTime.now().isAfter(expirationDate);
        return isExpired;
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  // static String diffDateTimeLang(DateTime? writeTime, BuildContext context) {
  //   late S lc = S.of(context);

  //   if (writeTime != null) {
  //     DateTime currentTime = DateTime.now().toUtc();
  //     Duration difference = currentTime.difference(writeTime);
  //     if (difference.inDays > 0) {
  //       return lc.product_detail_screen_write_time_days(difference.inDays);
  //     } else if (difference.inHours > 0) {
  //       return lc.product_detail_screen_write_time_hours(difference.inHours);
  //     } else if (difference.inMinutes > 0) {
  //       return lc
  //           .product_detail_screen_write_time_minutes(difference.inMinutes);
  //     } else {
  //       return lc.product_detail_screen_write_time_now;
  //     }
  //   } else {
  //     return ' - ';
  //   }
  // }

  // static String diffDateStringLang(String writeTime, BuildContext context) {
  //   late S lc = S.of(context);

  //   DateTime? time = DateTime.tryParse(writeTime);

  //   if (time != null) {
  //     DateTime currentTime = DateTime.now().toUtc();
  //     Duration difference = currentTime.difference(time);
  //     if (difference.inDays > 0) {
  //       return lc.product_detail_screen_write_time_days(difference.inDays);
  //     } else if (difference.inHours > 0) {
  //       return lc.product_detail_screen_write_time_hours(difference.inHours);
  //     } else if (difference.inMinutes > 0) {
  //       return lc
  //           .product_detail_screen_write_time_minutes(difference.inMinutes);
  //     } else {
  //       return lc.product_detail_screen_write_time_now;
  //     }
  //   } else {
  //     return writeTime;
  //   }
  // }

  static String getLanguageCode({required String languageName}) {
    switch (languageName) {
      case '한국어':
        return 'ko';
      case '태국어':
        return 'th';
      case '베트남':
        return 'vi';
      default:
        return 'en';
    }
  }

  static String systemLanguageCode({required BuildContext context}) {
    String lang = Localizations.localeOf(context).languageCode;
    if (!(lang == 'en' || lang == 'ko' || lang == 'th' || lang == 'vi')) {
      lang = 'en';
    }
    return lang;
  }

  // static String getLanguageName({required String languageCode, required S lc}) {
  //   switch (languageCode) {
  //     case 'ko':
  //       return lc.setting_language_Korean;
  //     case 'th':
  //       return lc.setting_language_ThailandLang;
  //     case 'vi':
  //       return lc.setting_language_VietnamLang;
  //     default:
  //       return lc.setting_language_English;
  //   }
  // }
}
