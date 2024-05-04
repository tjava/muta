import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/colors_constant.dart';

class GenericButton extends StatefulWidget {
  final String label;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final double height;
  final double width;
  final bool isPrimary;
  final bool isBusy;
  final bool disabled;
  final Function()? onClick;
  final FocusNode? focusNode;

  const GenericButton({
    super.key,
    required this.label,
    this.labelColor,
    this.labelStyle,
    this.backgroundColor,
    this.height = 56,
    this.width = 200.0,
    this.isPrimary = true,
    required this.onClick,
    this.focusNode,
    this.isBusy = false,
    this.disabled = false,
  });

  @override
  State<GenericButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.isBusy || widget.disabled ? null : widget.onClick!(),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
          children: [
            if (widget.isPrimary)
              Container(
                height: widget.height,
                margin: const EdgeInsets.only(left: 2.5, bottom: 2.5),
                decoration: BoxDecoration(
                  color: widget.disabled || widget.isBusy ? appGreen.withOpacity(.3) : appGreen,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            Container(
              height: widget.height,
              margin: const EdgeInsets.only(top: 2.5, right: 2.5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: widget.disabled || widget.isBusy ? lightGreen.withOpacity(.3) : lightGreen,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.label,
                    style: widget.labelStyle ??
                        TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: widget.labelColor,
                        ),
                  ),
                  _paddedLoading(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paddedLoading() {
    if (widget.isBusy) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 16.w),
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(.3)),
              strokeWidth: 2,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
