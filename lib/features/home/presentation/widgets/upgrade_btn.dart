import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class UpgradeBtn extends StatelessWidget {
  const UpgradeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(unlock),
          RowSizedBox(10.w),
          GenericText(
            text: 'Upgrade now to unlock all lessons',
            size: 13.sp,
            weight: FontWeight.w500,
            color: black,
          ),
        ],
      ),
    );
  }
}
