import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/modules/app/app.dart';
import 'package:weather_app/modules/app/cubits/app_cubit.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/utils/utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocConsumer<AppCubit, AppState>(
      buildWhen: (previous, current) => current is AppFailure,
      listener: (context, state) {
        if (state is AppFirstLaunch) {
          navigateAndReplaceAll(context, const IntroPage());
        } else if (state is AppAuthenticated) {
          navigateAndReplaceAll(context, const HomePage());
        } else if (state is AppUnAuthenticated) {
          navigateAndReplaceAll(context, LoginPage());
        } else if (state is AppFailure) {
          showErrorSnackBar(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is AppFailure) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${state.failure.message}'),
            ),
          );
        } else {
          return Scaffold(
            body: Lottie.asset(
              'assets/lottie/app_splash.json',
              animate: true,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              onLoaded: (_) async {
                await Future.delayed(const Duration(seconds: 2), () {});
                await cubit.initialize();
              },
            ),
          );
        }
      },
    );
  }
}
