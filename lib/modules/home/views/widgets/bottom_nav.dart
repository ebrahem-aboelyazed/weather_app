import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/modules/home/cubits/home_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: cubit.changePage,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.motion_photos_on_sharp),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
