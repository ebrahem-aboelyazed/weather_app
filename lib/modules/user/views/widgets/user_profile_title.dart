import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/common.dart';
import 'package:weather_app/modules/user/user.dart';

class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({super.key});

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
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: 1,
          child: ListTile(
            title: Text(
              _user?.displayName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: const UserAvatar(radius: 20),
          ),
        );
      },
    );
  }
}
