import 'package:flutter_svg/svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/generic_text_form_field.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/presentation/widgets/social_auth.dart';
import 'package:muta_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _disabled = true;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ColumnSizedBox(20.h),
                GenericRichText(
                  text: lblLoginDecs,
                  size: 24.sp,
                  weight: FontWeight.w700,
                  color: white,
                ),
                ColumnSizedBox(40.h),
                const SocialAuth(
                  title: lblGoogle,
                  image: google,
                ),
                ColumnSizedBox(20.h),
                const SocialAuth(
                  title: lblFacebook,
                  image: facebook,
                ),
                ColumnSizedBox(40.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: grey.withOpacity(.5),
                      ),
                    ),
                    RowSizedBox(10.w),
                    GenericText(
                      text: 'OR',
                      size: 12.sp,
                      weight: FontWeight.w700,
                      color: grey,
                    ),
                    RowSizedBox(10.w),
                    Expanded(
                      child: Divider(
                        color: grey.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
                ColumnSizedBox(40.h),
                Form(
                  key: _formKey,
                  child: FocusScope(
                    node: _focusNode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericTextFormField(
                          editingController: _emailController,
                          label: lblEmail,
                          textCapitalization: TextCapitalization.sentences,
                          inputType: TextInputType.emailAddress,
                          isRequired: true,
                          suffixIcon: _disabled
                              ? null
                              : Icon(
                                  Icons.clear,
                                  size: 20.sp,
                                  color: grey,
                                ),
                          onSuffixIconClick: () {
                            _emailController.clear();
                            _disabled = true;
                            setState(() {});
                          },
                          onChanged: (String val) {
                            if (val.isEmpty) {
                              _disabled = true;
                            } else {
                              _disabled = false;
                            }
                            setState(() {});
                          },
                          onEditingComplete: () => _focusNode.nextFocus(),
                        ),
                        ColumnSizedBox(30.h),
                        GenericButton(
                          label: lbllogWithEmail.toUpperCase(),
                          width: MediaQuery.of(context).size.width,
                          disabled: _disabled,
                          onClick: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              _focusNode.unfocus();
                              context.pushRoute(
                                CompleteLoginRoute(email: _emailController.text),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ColumnSizedBox(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenericText(
                      text: lblDntHaveAcct,
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: grey,
                    ),
                    RowSizedBox(5.w),
                    InkWell(
                      onTap: () => context.pushRoute(const RegisterRoute()),
                      child: GenericText(
                        text: lblSignUp,
                        size: 12.sp,
                        weight: FontWeight.w600,
                        color: appGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
