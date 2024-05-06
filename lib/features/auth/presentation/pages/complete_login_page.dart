import 'package:flutter_svg/flutter_svg.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/utils/snack_bar.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/generic_text_form_field.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:muta_test/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:muta_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class CompleteLoginPage extends StatefulWidget {
  final String email;
  const CompleteLoginPage({super.key, required this.email});

  @override
  State<CompleteLoginPage> createState() => _CompleteLoginPageState();
}

class _CompleteLoginPageState extends State<CompleteLoginPage> {
  late LoginCubit _loginCubit;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _loginCubit = locate<LoginCubit>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();

    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: state.message,
                color: red,
              ),
            );
          }

          if (state is Loaded) {
            context.router.replaceAll([const HomeRoute()]);
          }

          if (state is ShowPassword) {
            _obscure = state.showPassword;
          }
        },
        builder: (context, state) {
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
                        text: lblEnterPassword,
                        size: 24.sp,
                        weight: FontWeight.w700,
                        color: white,
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
                                label: 'Email',
                                textCapitalization: TextCapitalization.sentences,
                                inputType: TextInputType.emailAddress,
                                isBusy: true,
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _passwordController,
                                label: lblPass,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                obscureText: _obscure,
                                suffixIcon: Icon(
                                  _obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: grey,
                                ),
                                onSuffixIconClick: () {
                                  _loginCubit.showPassword(_obscure);
                                },
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(10.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GenericText(
                                  text: lblForgotPass,
                                  size: 12.sp,
                                  weight: FontWeight.w400,
                                  color: white.withOpacity(.8),
                                ),
                              ),
                              ColumnSizedBox(25.h),
                              GenericButton(
                                label: lblLogin.toUpperCase(),
                                width: MediaQuery.of(context).size.width,
                                isBusy: state is Loading ? true : false,
                                onClick: () async {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _focusNode.unfocus();
                                    _loginCubit.login(LoginPayloadEntity(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ));
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
        },
      ),
    );
  }
}
