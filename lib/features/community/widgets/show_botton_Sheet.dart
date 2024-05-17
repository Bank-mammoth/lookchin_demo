import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class ShowBottonSheet extends ConsumerWidget {
  const ShowBottonSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1.sh * 0.9,
      width: 1.sw,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          vertical(10),
          ListTile(
            leading: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios) // the arrow back icon
                  ),
            ),
            title: Center(
                child: ZimpleWidgets.zText('Address Setting',
                    useBold: true) // Your desired title
                ),
          ),
          SearchBarCustom(
            hintText: 'Search for address on map',
            onTap: () {},
          ),
          Flexible(
              child: Container(
            width: 1.sw,
            height: 1.sh,
            margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20),
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Show Autocomplete'),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    context.go("/tab/home");
                  } ,
                  child: const Text("sace"),
                )
              ],
            ),
            // child:  Center(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       const Text('use autocomple'),
            //       ZimpleWidgets.zInkButton(onTap: (){
            //         context.go("/tab/home");
            //       })
            //     ],
            //   ),
            // ),
          )),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: TextButton.icon(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              icon: const Icon(Icons.map),
              onPressed: () {
                print("Button pressed");
              },
              label: const Text("Choose from map"),
            ),
          ),
          vertical(10)
        ],
      ),
    );
  }
}

// class ShowBottonSheet extends StatefulWidget {
//   const ShowBottonSheet({
//     super.key,
//   });

//   @override
//   State<ShowBottonSheet> createState() => _ShowBottonSheetState();
// }

// class _ShowBottonSheetState extends State<ShowBottonSheet> {




//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 1.sh * 0.9,
//       width: 1.sw,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25.0),
//           topRight: Radius.circular(25.0),
//         ),
//       ),
//       child: Column(
//         children: [
//           vertical(10),
//           ListTile(
//             leading: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child:
//                       const Icon(Icons.arrow_back_ios) // the arrow back icon
//                   ),
//             ),
//             title: Center(
//                 child: ZimpleWidgets.zText('Address Setting',
//                     useBold: true) // Your desired title
//                 ),
//           ),
//           SearchBarCustom(
//             hintText: 'Search for address on map',
//             onTap: () {},
//           ),
//           Flexible(child: Container(color: Colors.amber,)),
//            Visibility(
// visible: ref,
//              child: Padding(
//                     padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom * 0.9.r,
//                     ),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: TextButton.icon(
//                         icon: const Icon(Icons.map),
//                         onPressed: () {
//                           // Action for the button
//                           print("Button pressed");
//                         },
//                        label: const Text("Choose from map"),
//                       ),
//                     ),
//                   ),
//            ),
//         ],
//       ),
//     );
//   }
// }
