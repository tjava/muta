import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(layer),
                    RowSizedBox(10.w),
                    GenericText(
                      text: 'Intermediate',
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(book),
                    RowSizedBox(10.w),
                    GenericText(
                      text: 'Lesson 2',
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 4.h,
                      width: MediaQuery.of(context).size.width * .46,
                      child: LinearProgressIndicator(
                        backgroundColor: grey,
                        valueColor: const AlwaysStoppedAnimation<Color>(orange),
                        borderRadius: BorderRadius.circular(10.r),
                        minHeight: 52.h,
                        value: .6,
                      ),
                    ),
                    RowSizedBox(5.w),
                    GenericText(
                      text: '52%',
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: white,
                    ),
                  ],
                ),
                Container(
                  height: 44.h,
                  width: MediaQuery.of(context).size.width * .58,
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericText(
                        text: 'Start learning',
                        size: 13.sp,
                        weight: FontWeight.w500,
                        color: black,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: appGreen,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(polygon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(yorubaSvg),
        ],
      ),
    );
  }
}
