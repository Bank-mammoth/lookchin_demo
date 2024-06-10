import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/profile/view_model/level_provider.dart';
import 'package:lookchin_app/features/profile_detail/profile_detail_screen.dart';
import 'package:lookchin_app/features/test_date.dart';
import 'package:lookchin_app/features/test_lookchin.dart';
import 'package:lookchin_app/test_stream/pages/ticker/ticker_page.dart';
import 'package:lookchin_app/test_stream/pages/timer/timer_page.dart';
import 'package:lookchin_app/utils/sub_app_bar.dart';

import '../../utils/simple_widgets.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double _progress = 0.0;
    double _sliderValue = 0.0;

    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: SubAppBar(leadingType: LeadingType.noButton, actionButton: [
        IconButton(
            onPressed: () => context.push('/setting'),
            icon: const Icon(Icons.settings)),
      ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('images/user1.png'),
                        ),
                        // child: ZimpleWidgets.zNetworkImage(
                        //     url: user!.userProfileImage ?? "",
                        //     height: 60,
                        //     width: 60,
                        //     boxFit: BoxFit.cover,
                        //     imageType: NetworkImageType.profile),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'username',
                            style: TextStyle(
                              color: Color(0xFF212123),
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(ProfileDetailScreen.routeName);
                              // context.pushNamed(
                              //   RouteNameZ.profileDetailScreen,
                              //   extra: {'userId': user!.userId},
                              // );
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "ดูประวัติ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF878B93),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(3.14),
                                  child: const Text("<"),
                                  // ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  // lookChinVer1(progress: _progress),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 1.sw,
                      height: 140.h,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          vertical(20),
                          Expanded(
                              child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 1.sw * 0.8,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: Colors.brown.shade400,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(20)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    horizontal(25),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 22,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 22,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 22,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 22,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                          Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      '125 exp point',
                                      style: TextStyle(
                                          fontSize: FontSize.bodySmall),
                                    ),
                                  ],
                                ),
                                counter.when(
                                  data: (data) {
                                    // double result = data / 100;
                                    print('data.level ==> ${data.level}');
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: LinearProgressIndicator(
                                          minHeight: 20,
                                          // backgroundColor: Colors.orange,
                                          color: Colors.lightGreen,
                                          borderRadius: BorderRadius.circular(20),
                                          value: data.level / 100,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                        ),
                                      ),
                                    );
                                  },
                                  error: (error, stackTrace) =>
                                      const SizedBox.shrink(),
                                  loading: () => const SizedBox.shrink(),
                                ),
                                //  Padding(
                                //           padding: const EdgeInsets.only(
                                //               top: 5, bottom: 5),
                                //           child: LinearProgressIndicator(
                                //             minHeight: 20,
                                //             color: Colors.lightGreen,
                                //             borderRadius:
                                //                 BorderRadius.circular(20),
                                //             value: 0.21,
                                //             semanticsLabel:
                                //                 'Linear progress indicator',
                                //           ),
                                //         ),
                                const Row(
                                  children: [
                                    Text(
                                      "LEVEL 41",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Spacer(),
                                    Text("250 exp to LEVEL 42")
                                  ],
                                )
                              ],
                            ),
                          ),
                          vertical(20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        columnIconText(
                          'profileScreen_ico_listing',
                          "listings",
                          //      onTap: () {
                          //   context.pushNamed(RouteNameZ.sellProductListScreen);
                          // }
                        ),
                        columnIconText(
                          'profileScreen_ico_purchases',
                          "purchases",
                          //      onTap: () {
                          //   context.pushNamed(RouteNameZ.buyProductListScreen);
                          // }
                        ),
                        columnIconText(
                          'profileScreen_ico_favorite',
                          "favorites",
                          //     onTap: () {
                          //   context.pushNamed(RouteNameZ.likeProductListScreen);
                          // }
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 12,
              decoration: const BoxDecoration(color: Color(0xFFF2F3F6)),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      // ZimpleWidgets.zSvgImage('myProfileEdit_ico_items'),
                      Icon(Icons.folder_open_rounded),

                      SizedBox(width: 10),
                      Text(
                        "รายการของฉัน",
                        style: TextStyle(
                          color: Color(0xFF212123),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Slider(
                  //   value: _sliderValue,
                  //   min: 0.0,
                  //   max: 100.0,
                  //   divisions: 100,
                  //   label: _sliderValue.round().toString(),
                  //   onChanged: (double value) {
                  //     setState(
                  //       () {
                  //         _sliderValue = value;
                  //         _progress = value / 100;
                  //       },
                  //     );
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ZimpleWidgets.zTextButton("+ 10", onPressed: () {
                        ref
                            .read(counterNotifierProvider.notifier)
                            .increaseValue(value: 10);
                      }),
                      ZimpleWidgets.zTextButton("- 10", onPressed: () {
                        ref
                            .read(counterNotifierProvider.notifier)
                            .decreaseValue(value: 10);
                      }),
                      ZimpleWidgets.zTextButton("+ 1", onPressed: () {
                        ref
                            .read(counterNotifierProvider.notifier)
                            .increaseValue(value: 1);
                      }),
                      ZimpleWidgets.zTextButton("- 1", onPressed: () {
                        ref
                            .read(counterNotifierProvider.notifier)
                            .decreaseValue(value: 1);
                      }),
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     ZimpleWidgets.zTextButton(
                  //       "Move to Date time",
                  //       onPressed: () => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const TestDate())),
                  //     ),
                  //     ZimpleWidgets.zTextButton(
                  //       "Test lookchin",
                  //       onPressed: () => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const TestLookChin())),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget columnIconText(String assetName, String name, {VoidCallback? onTap}) {
    return ZimpleWidgets.zInkButton(
      padding: const EdgeInsets.all(15),
      // onTap: onTap,
      child: Column(
        children: [
          ZimpleWidgets.zSvgImage(assetName),
          const SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF212123),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   double _progress = 0.0;
//   double _sliderValue = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SubAppBar(leadingType: LeadingType.noButton, actionButton: [
//         IconButton(
//             onPressed: () => context.push('/setting'),
//             icon: const Icon(Icons.settings)),
//       ]),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: const ShapeDecoration(
//                           shape: OvalBorder(),
//                         ),
//                         child: const CircleAvatar(
//                           backgroundImage: AssetImage('images/user1.png'),
//                         ),
//                         // child: ZimpleWidgets.zNetworkImage(
//                         //     url: user!.userProfileImage ?? "",
//                         //     height: 60,
//                         //     width: 60,
//                         //     boxFit: BoxFit.cover,
//                         //     imageType: NetworkImageType.profile),
//                       ),
//                       const SizedBox(width: 16),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'username',
//                             style: TextStyle(
//                               color: Color(0xFF212123),
//                               fontSize: 20,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               context.pushNamed(ProfileDetailScreen.routeName);
//                               // context.pushNamed(
//                               //   RouteNameZ.profileDetailScreen,
//                               //   extra: {'userId': user!.userId},
//                               // );
//                             },
//                             child: Row(
//                               children: [
//                                 const Text(
//                                   "ดูประวัติ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Color(0xFF878B93),
//                                     fontSize: 12,
//                                     fontFamily: 'Pretendard',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Transform(
//                                   alignment: Alignment.center,
//                                   transform: Matrix4.rotationY(3.14),
//                                   child: const Text("<"),
//                                   // ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   // lookChinVer1(progress: _progress),
//                   Card(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       width: 1.sw,
//                       height: 140.h,
//                       // color: Colors.amber,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           vertical(20),
//                           Expanded(
//                               child: Stack(
//                             children: [
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                   width: 1.sw * 0.8,
//                                   height: 3,
//                                   decoration: BoxDecoration(
//                                       color: Colors.brown.shade400,
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(20)),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Row(
//                                   children: [
//                                     horizontal(25),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.amber,
//                                         radius: 22,
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.amber,
//                                         radius: 22,
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.amber,
//                                         radius: 22,
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.amber,
//                                         radius: 22,
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1),
//                                       child: CircleAvatar(
//                                         backgroundColor: Colors.amber,
//                                         radius: 22,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           )),
//                           Center(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Spacer(),
//                                     Text(
//                                       '125 exp point',
//                                       style: TextStyle(
//                                           fontSize: FontSize.bodySmall),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 5, bottom: 5),
//                                   child: LinearProgressIndicator(
//                                     minHeight: 20,
//                                     color: Colors.lightGreen,
//                                     borderRadius: BorderRadius.circular(20),
//                                     value: _progress,
//                                     semanticsLabel: 'Linear progress indicator',
//                                   ),
//                                 ),
//                                 const Row(
//                                   children: [
//                                     Text(
//                                       "LEVEL 41",
//                                       style: TextStyle(color: Colors.green),
//                                     ),
//                                     Spacer(),
//                                     Text("250 exp to LEVEL 42")
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           vertical(20),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 11),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         columnIconText(
//                           'profileScreen_ico_listing',
//                           "listings",
//                           //      onTap: () {
//                           //   context.pushNamed(RouteNameZ.sellProductListScreen);
//                           // }
//                         ),
//                         columnIconText(
//                           'profileScreen_ico_purchases',
//                           "purchases",
//                           //      onTap: () {
//                           //   context.pushNamed(RouteNameZ.buyProductListScreen);
//                           // }
//                         ),
//                         columnIconText(
//                           'profileScreen_ico_favorite',
//                           "favorites",
//                           //     onTap: () {
//                           //   context.pushNamed(RouteNameZ.likeProductListScreen);
//                           // }
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 15),
//             Container(
//               height: 12,
//               decoration: const BoxDecoration(color: Color(0xFFF2F3F6)),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Row(
//                     children: [
//                       // ZimpleWidgets.zSvgImage('myProfileEdit_ico_items'),
//                       Icon(Icons.folder_open_rounded),

//                       SizedBox(width: 10),
//                       Text(
//                         "รายการของฉัน",
//                         style: TextStyle(
//                           color: Color(0xFF212123),
//                           fontSize: 16,
//                           fontFamily: 'Pretendard',
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 40),
//                   Slider(
//                     value: _sliderValue,
//                     min: 0.0,
//                     max: 100.0,
//                     divisions: 100,
//                     label: _sliderValue.round().toString(),
//                     onChanged: (double value) {
//                       setState(
//                         () {
//                           _sliderValue = value;
//                           _progress = value / 100;
//                         },
//                       );
//                     },
//                   ),
//                   // ZimpleWidgets.zTextButton(
//                   //   "Show Dialogs Two",
//                   //   onPressed: () {
//                   //     ZimpleWidgets.zShowDialogTwoButton(
//                   //       context: context,
//                   //       title: "Show dialog",
//                   //       onSavePressed: () {
//                   //         print('somrthing');
//                   //         context.pop();
//                   //       },
//                   //     );
//                   //   },
//                   // ),
//                   // ZimpleWidgets.zTextButton(
//                   //   "Show Dialogs One",
//                   //   onPressed: () {
//                   //     ZimpleWidgets.zShowDialogOneButton(
//                   //         context: context,
//                   //         title: "Show dialog",
//                   //         buttonTitle: "ตกลง",
//                   //         buttonbgColor: Colors.pink,
//                   //         buttonTextColor: colorWhite);
//                   //   },
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //   children: [
//                   //     ZimpleWidgets.zTextButton(
//                   //       "Move to Date time",
//                   //       onPressed: () => Navigator.push(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) => const TestDate())),
//                   //     ),
//                   //     ZimpleWidgets.zTextButton(
//                   //       "Test lookchin",
//                   //       onPressed: () => Navigator.push(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) => const TestLookChin())),
//                   //     ),
//                   //   ],
//                   // )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }

//   Widget columnIconText(String assetName, String name, {VoidCallback? onTap}) {
//     return ZimpleWidgets.zInkButton(
//       padding: const EdgeInsets.all(15),
//       // onTap: onTap,
//       child: Column(
//         children: [
//           ZimpleWidgets.zSvgImage(assetName),
//           const SizedBox(height: 6),
//           Text(
//             name,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Color(0xFF212123),
//               fontSize: 14,
//               fontFamily: 'Pretendard',
//               fontWeight: FontWeight.w400,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class LookChinVer1 extends StatelessWidget {
  const LookChinVer1({
    super.key,
    required double progress,
  }) : _progress = progress;

  final double _progress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // width: Util.deviceWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 1.sw,
        height: 100.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: LinearProgressIndicator(
                value: _progress,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  horizontal(10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // color: Colors.black,
        // child: CircleAvatar(
        //   backgroundColor: Colors.blue,
        // ),
        // child: ZimpleWidgets.zSvgImage('profile_wallet_border',
        //     boxFit: BoxFit.fill),
      ),
    );
  }
}
