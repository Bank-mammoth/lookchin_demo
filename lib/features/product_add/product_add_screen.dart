import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/custom_textfield.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class ProductAddScreen extends StatelessWidget {
  static const routeName = "productadd";
  const ProductAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorWhite,
          centerTitle: true,
          title: ZimpleWidgets.zText("New Listing", fontSize: FontSize.title),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.cancel),
          )),
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10),
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.grey.shade600,
                            ),
                            ZimpleWidgets.zText("0/8")
                          ],
                        ),
                      ),
                      vertical(20),
                      CustomTextField(
                        hintText: "Title",
                        hintontSize: FontSize.title,
                        underLine: true,
                        ),
                      vertical(20),
                       CustomTextField(
                        hintText: "\$ Price",
                        hintontSize: FontSize.title,
                        underLine: true,
                        ),
                      vertical(30),
                      Container(
                        width: 1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                 
                        child: const TextField(
                          maxLength: 2000,
                          decoration: InputDecoration(
                            hintText:"- Item Name (Brand)\n- Purchase Date\n- Item Condition (ex. Excellent/Good/Fair/Poor)\n- Usage Signs (Minimal/Slight/Noticeable)\n- Defects (None/Present)\n\nPlease fill in the detailed information about the item you are listing. (Trading of prohibited items may be restricted.)",                             
                            hintMaxLines:
                                15, // Set this to a value that fits your content
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              vertical(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                height: 48.h,
                width: 1.sw,
                child: ZimpleWidgets.zTextButton("Post", onPressed: () {}),
              ),
              vertical(20)
            ],
          ),
          // child: SingleChildScrollView(
          //   // physics: const NeverScrollableScrollPhysics(),
          //   child: Container(
          //     // padding: EdgeInsets.only(bottom: 20.sp),
          //     width: 1.sw,
          //     height: 1.sh,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       mainAxisSize: MainAxisSize.max,
          //       children: [
          //         Column(
          //           children: [
          //             vertical(20),
          //             Stack(
          //               children: [
          //                 Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: IconButton(
          //                       onPressed: () {
          //                         Navigator.pop(context);
          //                       },
          //                       icon: const Icon(Icons.cancel)),
          //                 ),
          //                 Align(
          //                   alignment: Alignment.center,
          //                   child: ZimpleWidgets.zText("New Listing",
          //                       fontSize: FontSize.title),
          //                 )
          //               ],
          //             ),
          //             vertical(20),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 20),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     width: 80.w,
          //                     height: 80.h,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         color: Colors.grey.shade300),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         Icon(
          //                           Icons.camera_alt_outlined,
          //                           size: 40,
          //                           color: Colors.grey.shade600,
          //                         ),
          //                         ZimpleWidgets.zText("0/8")
          //                       ],
          //                     ),
          //                   ),
          //                   vertical(20),
          //                   const TextField(
          //                     decoration: InputDecoration(hintText: "Title"),
          //                   ),
          //                   vertical(20),
          //                   const TextField(
          //                     decoration: InputDecoration(hintText: "\$ Price"),
          //                   ),
          //                   vertical(30),
          //                   Container(
          //                     width: 1.sw,
          //                     padding: const EdgeInsets.all(10),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       border: Border.all(
          //                         color: Colors.grey,
          //                         width: 1.0,
          //                       ),
          //                     ),
          //                     child: const TextField(
          //                       maxLength: 2000,
          //                       decoration: InputDecoration(
          //                         hintText:
          //                             "- Item Name (Brand)\n- Purchase Date\n- Item Condition (ex. Excellent/Good/Fair/Poor)\n- Usage Signs (Minimal/Slight/Noticeable)\n- Defects (None/Present)\n\nPlease fill in the detailed information about the item you are listing. (Trading of prohibited items may be restricted.)",
          //                         hintMaxLines:
          //                             15, // Set this to a value that fits your content
          //                         border: InputBorder.none,
          //                         contentPadding: EdgeInsets.all(16.0),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //         Container(
          //           padding: EdgeInsets.symmetric(horizontal: 30.sp),
          //           height: 48.h,
          //           width: 1.sw,
          //           child: ZimpleWidgets.zTextButton("Post", onPressed: () {}),
          //         ),

          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
