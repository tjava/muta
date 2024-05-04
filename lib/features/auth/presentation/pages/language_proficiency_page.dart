import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/domain/entities/language_speak_entity.dart';
import 'package:muta_test/features/auth/presentation/widgets/language_proficiency_item.dart';
import 'package:muta_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LanguageProficiencyPage extends StatefulWidget {
  final String language;
  const LanguageProficiencyPage({super.key, required this.language});

  @override
  State<LanguageProficiencyPage> createState() => _LanguageProficiencyPageState();
}

class _LanguageProficiencyPageState extends State<LanguageProficiencyPage> {
  int selectedIndex = 0;

  late final List<LanguageSpeakEntity> listLanguageProficiency;

  @override
  void initState() {
    super.initState();

    listLanguageProficiency = [
      LanguageSpeakEntity(
        title: 'Novice',
        subTitle: 'I’m new to ${widget.language}',
        flag: level1,
      ),
      LanguageSpeakEntity(
        title: 'Beginner',
        subTitle: 'I know some words in ${widget.language}',
        flag: level2,
      ),
      LanguageSpeakEntity(
        title: 'Intermediate',
        subTitle: 'I can have simple conversations in ${widget.language}',
        flag: level3,
      ),
    ];
  }

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 90.w),
              child: GenericRichText(
                text: 'How would you rate your proficiency in ${widget.language}?',
                size: 17.sp,
                weight: FontWeight.w600,
                color: white,
                textAlign: TextAlign.start,
                lineHeight: 1.5,
              ),
            ),
            ColumnSizedBox(30.h),
            for (int index = 0; index < listLanguageProficiency.length; index++) ...[
              LanguageProficiencyTtem(
                title: listLanguageProficiency[index].title,
                subTitle: listLanguageProficiency[index].subTitle!,
                flag: listLanguageProficiency[index].flag,
                selected: index == selectedIndex,
                onClick: () {
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              ColumnSizedBox(30.h),
            ],
            const Spacer(),
            GenericButton(
              label: lblContinue.toUpperCase(),
              width: MediaQuery.of(context).size.width,
              onClick: () => context.pushRoute(const RegisterRoute()),
            ),
            ColumnSizedBox(10.h),
          ],
        ),
      ),
    );
  }
}
