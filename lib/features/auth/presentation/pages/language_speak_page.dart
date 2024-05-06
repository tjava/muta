import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/domain/entities/language_speak_entity.dart';
import 'package:muta_test/features/auth/presentation/widgets/language_speak_item.dart';
import 'package:muta_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LanguageSpeakPage extends StatefulWidget {
  const LanguageSpeakPage({super.key});

  @override
  State<LanguageSpeakPage> createState() => _LanguageSpeakPageState();
}

class _LanguageSpeakPageState extends State<LanguageSpeakPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () => context.back(),
            child: SvgPicture.asset(back),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ColumnSizedBox(20.h),
                for (int index = 0; index < listLanguageSpeak.length; index++) ...[
                  LanguageSpeakItem(
                    title: listLanguageSpeak[index].title,
                    flag: listLanguageSpeak[index].flag,
                    selected: index == selectedIndex,
                    onClick: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                  ),
                  ColumnSizedBox(30.h),
                ],
                ColumnSizedBox(20.h),
                GenericButton(
                  label: lblContinue.toUpperCase(),
                  width: MediaQuery.of(context).size.width,
                  onClick: () => context.pushRoute(const LanguageToLearnRoute()),
                ),
                ColumnSizedBox(10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
