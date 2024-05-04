import 'package:flutter/widgets.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/domain/entities/country_entity.dart';
import 'package:muta_test/core/utils/snack_bar.dart';
import 'package:muta_test/core/utils/text_field_validators.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/generic_text_form_field.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:muta_test/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:muta_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class CompleteRegisterPage extends StatefulWidget {
  final String email;
  const CompleteRegisterPage({super.key, required this.email});

  @override
  State<CompleteRegisterPage> createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  late RegisterCubit _registerCubit;

  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _obscure = true;
  bool _disableFirstName = true;
  bool _disableLastName = true;

  @override
  void initState() {
    super.initState();
    _registerCubit = locate<RegisterCubit>();

    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();

    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _registerCubit,
      child: BlocConsumer<RegisterCubit, RegisterState>(
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
              leading: GestureDetector(
                onTap: () => context.back(),
                child: Image.asset(back),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ColumnSizedBox(20.h),
                      GenericRichText(
                        text: lblEmailName,
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
                                editingController: _firstNameController,
                                label: lblFirstName,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                suffixIcon: _disableFirstName
                                    ? null
                                    : Icon(
                                        Icons.clear,
                                        size: 20.sp,
                                        color: grey,
                                      ),
                                onSuffixIconClick: () {
                                  _firstNameController.clear();
                                  _disableFirstName = true;
                                  setState(() {});
                                },
                                onChanged: (String val) {
                                  if (val.isEmpty) {
                                    _disableFirstName = true;
                                  } else {
                                    _disableFirstName = false;
                                  }
                                  setState(() {});
                                },
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _lastNameController,
                                label: lblLastName,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                suffixIcon: _disableLastName
                                    ? null
                                    : Icon(
                                        Icons.clear,
                                        size: 20.sp,
                                        color: grey,
                                      ),
                                onSuffixIconClick: () {
                                  _lastNameController.clear();
                                  _disableLastName = true;
                                  setState(() {});
                                },
                                onChanged: (String val) {
                                  if (val.isEmpty) {
                                    _disableLastName = true;
                                  } else {
                                    _disableLastName = false;
                                  }
                                  setState(() {});
                                },
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
                                validators: [
                                  containsLowercaseValidator,
                                  containsUppercaseValidator,
                                  containsNumericValidator,
                                  containsCharacterValidator,
                                  notContainWhiteSpace,
                                  charactersLengthValidator(6),
                                ],
                                suffixIcon: Icon(
                                  _obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: grey,
                                ),
                                onSuffixIconClick: () {
                                  _registerCubit.showPassword(_obscure);
                                },
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(30.h),
                              GenericButton(
                                label: lblSignUp.toUpperCase(),
                                width: MediaQuery.of(context).size.width,
                                isBusy: state is Loading ? true : false,
                                onClick: () async {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _focusNode.unfocus();
                                    _registerCubit.register(RegisterPayloadEntity(
                                      email: _emailController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      password: _passwordController.text,
                                      signinType: 'password',
                                      spokenLanguage: '7d0f00aa-1028-4871-abc1-0237dff35356',
                                      userType: 'learner',
                                      countryEntity: const CountryEntity(
                                        name: 'Nigeria',
                                        code: 'NG',
                                        flag:
                                            'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NG.svg',
                                      ),
                                    ));
                                  }
                                },
                              ),
                              ColumnSizedBox(20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GenericText(
                                    text: lblHaveAcct,
                                    size: 12.sp,
                                    weight: FontWeight.w400,
                                    color: grey,
                                  ),
                                  RowSizedBox(5.w),
                                  InkWell(
                                    onTap: () => context.pushRoute(const LoginRoute()),
                                    child: GenericText(
                                      text: lblLogin,
                                      size: 12.sp,
                                      weight: FontWeight.w600,
                                      color: appGreen,
                                    ),
                                  ),
                                ],
                              ),
                              ColumnSizedBox(10.h),
                            ],
                          ),
                        ),
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
