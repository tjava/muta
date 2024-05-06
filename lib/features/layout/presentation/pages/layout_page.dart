import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AutoTabsScaffold(
      routes: const [
        NewHomeRoute(),
        NewHomeRoute(),
        NewHomeRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: cardGrey)),
        ),
        child: BottomNavigationBar(
          backgroundColor: backgrand,
          selectedItemColor: appGreen,
          unselectedItemColor: grey2,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) async {
            tabsRouter.setActiveIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                home,
                height: 22.h,
                width: 22.w,
                color: grey2,
              ),
              activeIcon: SvgPicture.asset(
                home,
                height: 22.h,
                width: 22.w,
                color: appGreen,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                learn,
                height: 22.h,
                width: 22.w,
                color: grey2,
              ),
              activeIcon: SvgPicture.asset(
                learn,
                height: 22.h,
                width: 22.w,
                color: appGreen,
              ),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                live,
                height: 22.h,
                width: 22.w,
                color: grey2,
              ),
              activeIcon: SvgPicture.asset(
                live,
                height: 22.h,
                width: 22.w,
                color: appGreen,
              ),
              label: 'Live Session',
            ),
          ],
        ),
      ),
    );
  }
}
