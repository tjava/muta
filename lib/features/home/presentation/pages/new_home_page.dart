import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/features/home/presentation/widgets/book_card.dart';
import 'package:muta_test/features/home/presentation/widgets/header.dart';
import 'package:muta_test/features/home/presentation/widgets/home_card.dart';
import 'package:muta_test/features/home/presentation/widgets/leaderboard.dart';

@RoutePage<dynamic>()
class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                ColumnSizedBox(25.h),
                const HomeCard(),
                ColumnSizedBox(30.h),
                const BookCard(),
                ColumnSizedBox(30.h),
                const Leaderboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
