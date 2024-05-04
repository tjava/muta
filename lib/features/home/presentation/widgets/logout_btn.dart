import 'package:auto_route/auto_route.dart';
import 'package:muta_test/core/constants/colors_constant.dart';
import 'package:muta_test/core/utils/snack_bar.dart';
import 'package:muta_test/core/widgets/generic_button.dart';
import 'package:muta_test/features/home/presentation/cubits/logout/logout_cubit.dart';
import 'package:muta_test/navigator/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
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
          context.router.replaceAll([const LoginRoute()]);
        }
      },
      builder: (context, state) {
        return GenericButton(
          label: 'LOGOUT',
          labelColor: red,
          width: MediaQuery.of(context).size.width,
          isBusy: state is Loading ? true : false,
          onClick: () async {
            context.read<LogoutCubit>().logout();
          },
        );
      },
    );
  }
}
