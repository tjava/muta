import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: cardGrey2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SvgPicture.asset(pen)),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: GenericRichText(
                text: 'Review your most recent lesson',
                size: 15.sp,
                weight: FontWeight.w700,
                color: black,
                textAlign: TextAlign.start,
                lineHeight: 1.5,
              ),
            ),
          ),
          Expanded(
            child: Icon(
              Icons.navigate_next,
              size: 30.sp,
              color: grey2,
            ),
          ),
        ],
      ),
    );
  }
}
