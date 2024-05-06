import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_text.dart';

class LanguageLearnItem extends StatelessWidget {
  final String title;
  final String flag;
  final Function onClick;
  final bool selected;

  const LanguageLearnItem({
    super.key,
    required this.title,
    required this.flag,
    required this.onClick,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: selected ? appGreen : grey.withOpacity(.2),
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              flag,
              color: selected ? appGreen : grey,
            ),
            ColumnSizedBox(15.w),
            GenericText(
              text: title,
              size: 14.sp,
              weight: FontWeight.w500,
              color: selected ? appGreen : white,
            ),
          ],
        ),
      ),
    );
  }
}
