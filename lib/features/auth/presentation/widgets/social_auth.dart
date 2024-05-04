import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class SocialAuth extends StatelessWidget {
  final String title;
  final String image;
  const SocialAuth({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset(image),
          RowSizedBox(25.w),
          GenericText(
            text: title.toUpperCase(),
            size: 12.sp,
            weight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
