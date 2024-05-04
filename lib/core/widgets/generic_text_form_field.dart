import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/constants/string_constant.dart';
import 'package:muta_test/core/utils/email_validator.dart';
import 'package:muta_test/core/utils/text_field_validators.dart';

class GenericTextFormField extends StatefulWidget {
  final TextEditingController editingController;
  final String label;
  final String? hint;
  final String? errorText;
  final IconData? icon;
  final TextInputType inputType;
  final TextAlign textAlign;
  final int maxLine;
  final int? maxLen;
  final bool isRequired;
  final bool showErrorMsg;
  final bool obscureText;
  final bool isBusy;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Icon? suffixIcon;
  final Function()? onSuffixIconClick;
  final Icon? prefixIcon;
  final Function()? onPrefixIconClick;
  final Function(bool)? onFocusChange;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry contentPadding;
  // final bool shouldEnableClearbutton;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final List<TextFieldValidatorEntity>? validators;
  final double labelSize;
  final bool hasSpaceBetween;
  final bool willShowDot;

  const GenericTextFormField(
      {required this.editingController,
      required this.label,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.textAlign = TextAlign.start,
      this.maxLine = 1,
      this.maxLen,
      this.isRequired = false,
      this.showErrorMsg = true,
      this.icon,
      this.hint,
      this.isBusy = false,
      this.focusNode,
      this.inputFormatters,
      this.onEditingComplete,
      this.suffixIcon,
      this.onSuffixIconClick,
      this.prefixIcon,
      this.onPrefixIconClick,
      this.onFocusChange,
      this.onChanged,
      this.contentPadding = const EdgeInsets.symmetric(vertical: 8),
      // this.shouldEnableClearbutton = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.validator,
      this.validators,
      this.errorText,
      this.labelSize = 16,
      this.hasSpaceBetween = false,
      this.willShowDot = false,
      super.key});

  @override
  State<GenericTextFormField> createState() => _GenericTextFormFieldState();
}

class _GenericTextFormFieldState extends State<GenericTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool isFocused) {},
      skipTraversal: true,
      child: TextFormField(
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        keyboardType: widget.inputType,
        enabled: !widget.isBusy,
        maxLines: widget.maxLine,
        maxLength: widget.maxLen,
        cursorColor: white,
        onEditingComplete: widget.onEditingComplete,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        validator: widget.validator ??
            (String? value) {
              if (widget.isRequired && value!.trim() == '') {
                return widget.showErrorMsg ? errRequiredMsg : '';
              }
              if (widget.inputType == TextInputType.emailAddress &&
                  !EmailValidator.validate(value)) {
                if (value == '' && !widget.isRequired) {
                  return null;
                } else {
                  return errInvalidEmail;
                }
              }
              if (widget.validators != null && value != null && value.trim() != '') {
                for (var validator in widget.validators!) {
                  if (!validator.isValid(value.trim())) {
                    return validator.message;
                  }
                }
              }
              return null;
            },
        controller: widget.editingController,
        obscureText: widget.obscureText,
        style: const TextStyle(color: white),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: grey,
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: appGreen,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: grey.withOpacity(.5),
              width: 1.h,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appGreen,
              width: 1.4.h,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: red,
              width: 1.h,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: red,
              width: 1.h,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: grey.withOpacity(.15),
              width: 1.h,
            ),
          ),
          contentPadding: widget.contentPadding,
          hintText: widget.hint,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  child: widget.suffixIcon,
                  onTap: () => widget.onSuffixIconClick!(),
                )
              : null,
          prefixIcon: widget.prefixIcon != null
              ? GestureDetector(
                  child: widget.prefixIcon,
                  onTap: () => widget.onPrefixIconClick!(),
                )
              : null,
          // floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
