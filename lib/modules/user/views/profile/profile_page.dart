import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/modules/user/views/widgets/profile_info_view.dart';
import 'package:weather_app/modules/user/views/widgets/user_profile_header.dart';
import 'package:weather_app/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage() : super(key: const Key('ProfilePageKey'));

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubit = context.read<UserCubit>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.25,
          elevation: 0,
          backgroundColor: Colors.grey[50],
          automaticallyImplyLeading: false,
          pinned: true,
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.black),
            ),
          ],
          flexibleSpace: const FlexibleSpaceBar(
            background: UserProfileHeader(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: Dimensions.paddingDefault),
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSmall),
                      child: Text(
                        'Account',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      title: const Text('Profile Info'),
                      trailing: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                      leading: const Icon(
                        Icons.info_rounded,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) => const ProfileInfoView(),
                          isScrollControlled: true,
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      trailing: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                      ),
                      onTap: cubit.signOutUser,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
