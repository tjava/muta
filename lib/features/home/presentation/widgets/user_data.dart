import 'package:cached_network_image/cached_network_image.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/utils/snack_bar.dart';
import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/core/widgets/generic_rich_text.dart';
import 'package:muta_test/core/widgets/generic_text.dart';
import 'package:muta_test/core/widgets/row_sized_box.dart';
import 'package:muta_test/features/home/presentation/cubits/get_all_languages/get_all_languages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllLanguagesCubit, GetAllLanguagesState>(
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
      },
      builder: (context, state) {
        return state is Loaded
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int index = 0;
                        index < state.languagesEntity.listLanguageEntity.length;
                        index++) ...[
                      Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: state.languagesEntity.listLanguageEntity[index].languageIcon,
                          placeholder: (context, url) => SizedBox(
                            height: 100.h,
                            width: 100.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.5,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 22.sp,
                            color: red,
                          ),
                          height: 60.h,
                          width: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ColumnSizedBox(15.h),
                      Row(
                        children: [
                          GenericText(
                            text: 'Language Name:',
                            size: 14.sp,
                            weight: FontWeight.w700,
                          ),
                          RowSizedBox(15.w),
                          GenericRichText(
                            text: state.languagesEntity.listLanguageEntity[index].languageName,
                            textAlign: TextAlign.start,
                            weight: FontWeight.w500,
                            color: black,
                          ),
                        ],
                      ),
                      ColumnSizedBox(5.h),
                      Row(
                        children: [
                          GenericText(
                            text: 'Language Code:',
                            size: 14.sp,
                            weight: FontWeight.w700,
                          ),
                          RowSizedBox(15.w),
                          Expanded(
                            child: GenericRichText(
                              text: state.languagesEntity.listLanguageEntity[index].languageCode,
                              textAlign: TextAlign.start,
                              weight: FontWeight.w500,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      ColumnSizedBox(5.h),
                      Row(
                        children: [
                          GenericText(
                            text: 'African:',
                            size: 14.sp,
                            weight: FontWeight.w700,
                          ),
                          RowSizedBox(15.w),
                          GenericRichText(
                            text: state.languagesEntity.listLanguageEntity[index].isAfrican
                                .toString(),
                            weight: FontWeight.w500,
                            color: black,
                          ),
                        ],
                      ),
                      ColumnSizedBox(5.h),
                      Row(
                        children: [
                          GenericText(
                            text: 'Published:',
                            size: 14.sp,
                            weight: FontWeight.w700,
                          ),
                          RowSizedBox(15.w),
                          GenericRichText(
                            text: state.languagesEntity.listLanguageEntity[index].published
                                .toString(),
                            weight: FontWeight.w500,
                            color: black,
                          ),
                        ],
                      ),
                      ColumnSizedBox(10.h),
                    ],
                  ],
                ),
              )
            : const CircularProgressIndicator(color: appGreen);
      },
    );
  }
}
