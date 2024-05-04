import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/constants/font_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 280.h,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(wellcome),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GenericText(
                    text: lblLearn,
                    weight: FontWeight.w300,
                    color: white,
                  ),
                  GenericText(
                    text: lblAfrica,
                    fontFamily: kMagica,
                    size: 60.sp,
                    weight: FontWeight.w300,
                    color: white,
                  ),
                ],
              ),
            ),
          ),
          ColumnSizedBox(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: GenericRichText(
              text: lblMutaHelps,
              size: 14.sp,
              weight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ),
          ColumnSizedBox(50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: GenericButton(
              label: lblGetStated.toUpperCase(),
              width: MediaQuery.of(context).size.width,
              onClick: () => context.pushRoute(const LanguageSpeakRoute()),
            ),
          ),
          ColumnSizedBox(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: GenericButton(
              label: lblLogin.toUpperCase(),
              labelColor: lightGreen,
              width: MediaQuery.of(context).size.width,
              isPrimary: false,
              onClick: () => context.pushRoute(const LoginRoute()),
            ),
          ),
          const Spacer(),
          GenericText(
            text: lblByContinuing,
            size: 10.sp,
            weight: FontWeight.w600,
            color: grey,
          ),
          ColumnSizedBox(3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericText(
                text: 'Terms of Service',
                size: 10.sp,
                weight: FontWeight.w600,
                color: lightGreen,
              ),
              GenericText(
                text: ' and ',
                size: 10.sp,
                weight: FontWeight.w600,
                color: grey,
              ),
              GenericText(
                text: 'Privacy Policy',
                size: 10.sp,
                weight: FontWeight.w600,
                color: lightGreen,
              ),
            ],
          ),
          ColumnSizedBox(10.h),
        ],
      ),
    );
  }
}
