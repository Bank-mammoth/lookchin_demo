part of '/common/main_nav_screen.dart';

class BuildBotton extends StatelessWidget {
  const BuildBotton({
    super.key,
    required this.currentIndex,
    required this.ontap,
    required this.icon,
    this.height,
    required this.activeIndex,
  });

  final int currentIndex;
  final Function() ontap;
  final IconData icon;
  final int activeIndex;
  final double? height;

  @override
  Widget build(BuildContext context) {
    bool isActive = currentIndex == (activeIndex);
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: height ?? 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.blue : Colors.black,
              size: 30.sp,
            ),
            // Text(
            //   title,
            //   style: TextStyle(fontSize: FontSize.subtitlesmall),
            // ),
          ],
        ),
      ),
    );
  }
}
