import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/features/home/presentation/widgets/leaderboard_card.dart';
import 'package:muta_test/features/home/presentation/widgets/upgrade_btn.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GenericText(
              text: 'Leaderboard',
              size: 15.sp,
              weight: FontWeight.w700,
              color: white,
            ),
            Icon(
              Icons.navigate_next,
              size: 30.sp,
              color: grey3,
            ),
          ],
        ),
        ColumnSizedBox(20.h),
        for (int index = 0; index < 3; index++) ...[
          LeaderboardCard(name: 'Tino Vinus', num: index),
          ColumnSizedBox(15.h),
        ],
        const LeaderboardCard(name: 'Me', num: 606),
        ColumnSizedBox(30.h),
        const UpgradeBtn(),
        ColumnSizedBox(20.h),
      ],
    );
  }
}
