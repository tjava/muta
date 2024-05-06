import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class LeaderboardCard extends StatelessWidget {
  final String name;
  final int num;
  const LeaderboardCard({super.key, required this.name, required this.num});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.h,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: name == 'Me' ? cardYellow : cardGrey,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Container(
                  // padding: EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    picPng,
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                RowSizedBox(15.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GenericText(
                      text: name,
                      size: 14.sp,
                      weight: FontWeight.w700,
                      color: name == 'Me' ? black : white,
                    ),
                    ColumnSizedBox(5.h),
                    Row(
                      children: [
                        GenericText(
                          text: 'United States',
                          size: 13.sp,
                          weight: FontWeight.w400,
                          color: name == 'Me' ? black.withOpacity(.7) : grey3,
                        ),
                        RowSizedBox(5.w),
                        SvgPicture.asset(usa),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                GenericText(
                  text: '🏆 15,832',
                  size: 12.sp,
                  weight: FontWeight.w500,
                  color: name == 'Me' ? black : orange,
                ),
              ],
            ),
          ),
          Container(
            height: name == 'Me' ? 24.w : 22.h,
            width: name == 'Me' ? 36.w : 26.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: name == 'Me' ? cardGrey : white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            child: GenericText(
              text: '${num + 1}.',
              size: 12.sp,
              weight: FontWeight.w700,
              color: name == 'Me' ? white : black,
            ),
          ),
        ],
      ),
    );
  }
}
