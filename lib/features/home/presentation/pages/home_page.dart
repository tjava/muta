import 'package:muta_test/core/widgets/column_sized_box.dart';
import 'package:muta_test/features/home/presentation/cubits/get_all_languages/get_all_languages_cubit.dart';
import 'package:muta_test/features/home/presentation/cubits/logout/logout_cubit.dart';
import 'package:muta_test/features/home/presentation/widgets/logout_btn.dart';
import 'package:muta_test/features/home/presentation/widgets/user_data.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetAllLanguagesCubit _getAllLanguagesCubit;
  late LogoutCubit _logoutCubit;

  @override
  void initState() {
    super.initState();

    _getAllLanguagesCubit = locate<GetAllLanguagesCubit>();
    _logoutCubit = locate<LogoutCubit>();

    _getAllLanguagesCubit.getAllLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllLanguagesCubit>.value(value: _getAllLanguagesCubit),
        BlocProvider<LogoutCubit>.value(value: _logoutCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserData(),
                ColumnSizedBox(30.h),
                const LogoutBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
