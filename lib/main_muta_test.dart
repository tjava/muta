import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta_test/core/constants/font_constant.dart';
import 'package:muta_test/core/cubits/connectivity/connectivity_cubit.dart';
import 'package:muta_test/core/utils/globa_keys.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:muta_test/navigator/router.dart';

class MainMutaTest extends StatefulWidget {
  const MainMutaTest({super.key});

  static final appRouter = AppRouter();

  @override
  State<MainMutaTest> createState() => _MainMutaTestState();
}

class _MainMutaTestState extends State<MainMutaTest> {
  late ConnectivityCubit _connectivityCubit;

  @override
  void initState() {
    super.initState();
    _connectivityCubit = locate<ConnectivityCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Muta Test',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: black,
              fontFamily: kAxiforma,
              appBarTheme: const AppBarTheme(
                backgroundColor: backgrand,
                surfaceTintColor: backgrand,
                centerTitle: true,
                elevation: 0,
              ),
            ),
            scaffoldMessengerKey: scaffoldMessengerKey,
            routerConfig: MainMutaTest.appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
