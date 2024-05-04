import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/domain/entities/language_speak_entity.dart';
import 'package:muta_test/features/auth/presentation/widgets/language_learn_item.dart';
import 'package:muta_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LanguageToLearnPage extends StatefulWidget {
  const LanguageToLearnPage({super.key});

  @override
  State<LanguageToLearnPage> createState() => _LanguageToLearnPageState();
}

class _LanguageToLearnPageState extends State<LanguageToLearnPage> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.back(),
          child: Image.asset(back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnSizedBox(10.h),
              GenericText(
                text: lblWantToLearn,
                size: 17.sp,
                weight: FontWeight.w600,
                color: white,
              ),
              ColumnSizedBox(20.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0.w,
                  mainAxisSpacing: 10.0.h,
                  childAspectRatio: 40.h / 40.h,
                ),
                itemCount: listLanguageLearn.length,
                itemBuilder: (BuildContext context, int index) {
                  return LanguageLearnItem(
                    title: listLanguageLearn[index].title,
                    flag: listLanguageLearn[index].flag,
                    selected: index == selectedIndex,
                    onClick: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                  );
                },
              ),
              ColumnSizedBox(40.h),
              GenericButton(
                label: lblContinue.toUpperCase(),
                width: MediaQuery.of(context).size.width,
                onClick: () => context.pushRoute(
                  LanguageProficiencyRoute(language: listLanguageLearn[selectedIndex].title),
                ),
              ),
              ColumnSizedBox(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
