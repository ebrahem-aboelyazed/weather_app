import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/modules/user/views/profile/edit_profile_page.dart';
import 'package:weather_app/utils/utils.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    final _currentUser = cubit.currentUser;
    final _userStream = cubit.userStream;
    return StreamBuilder<User?>(
      stream: _userStream,
      initialData: _currentUser,
      builder: (context, snapshot) {
        final _user = snapshot.data;
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingDefault),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () => navigateTo(context, EditProfilePage()),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: const Size(120, 40),
                      elevation: 0,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Full name'),
                  subtitle: Text(_user?.displayName ?? ''),
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(_user?.email ?? ''),
                  leading: const Icon(Icons.email),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
