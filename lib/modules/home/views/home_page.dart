import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/app/cubits/app_cubit.dart';
import 'package:weather_app/modules/home/cubits/home_cubit.dart';
import 'package:weather_app/modules/home/views/widgets/bottom_nav.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit.dart';
import 'package:weather_app/modules/weather/views/weather_page.dart';
import 'package:weather_app/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final appCubit = context.read<AppCubit>();
    return BlocProvider<WeatherCubit>(
      create: (context) {
        final position = appCubit.userLocation;
        return WeatherCubit()..getWeatherByGeo(position);
      },
      child: Scaffold(
        bottomNavigationBar: const BottomNav(),
        body: BlocListener<UserCubit, UserState>(
          listenWhen: (previous, current) => current is UserLoggedOut,
          listener: (ctx, state) {
            if (state is UserLoggedOut) {
              navigateAndReplaceAll(context, LoginPage());
            }
          },
          child: WillPopScope(
            onWillPop: () async {
              if (cubit.state != 0) {
                cubit.changePage(0);
                return false;
              } else {
                return true;
              }
            },
            child: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.changePage,
              children: const [
                WeatherPage(),
                ProfilePage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
