import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';

class LanguageProficiencyTtem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String flag;
  final Function onClick;
  final bool selected;
  const LanguageProficiencyTtem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.flag,
    required this.onClick,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: 82.h,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: selected ? grey : grey.withOpacity(.2),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(flag),
            RowSizedBox(15.w),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericText(
                    text: title,
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: white,
                  ),
                  ColumnSizedBox(5.h),
                  GenericRichText(
                    text: subTitle,
                    size: 12.sp,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    lineHeight: 1.4,
                    color: grey,
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (selected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: appGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 11.sp,
                  color: white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
