import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GenericText(
              text: 'Yoruba Lessons',
              size: 14.sp,
              weight: FontWeight.w700,
              color: white,
            ),
            RowSizedBox(4.w),
            Icon(
              Icons.arrow_drop_down,
              size: 25.sp,
              color: white,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(notification),
            RowSizedBox(15.w),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(person),
            ),
          ],
        ),
      ],
    );
  }
}
