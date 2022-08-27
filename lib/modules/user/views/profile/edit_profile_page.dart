import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/common.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/utils/utils.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final SignUpModel model = SignUpModel();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    final _user = cubit.currentUser;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Profile')),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: cubit.formKeyTwo,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingDefault),
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserUpdated) {
                  showSuccessSnackBar(context, 'Info Updated Successfully!');
                }
                if (state is UserFailure) {
                  showErrorSnackBar(context, state.failure);
                }
              },
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state is UserLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: Dimensions.paddingDefault),
                      NameField(
                        onChanged: (value) => model.name = value,
                        hint: 'Name',
                        label: 'Name',
                        initialValue: _user?.displayName,
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      IgnorePointer(
                        child: EmailField(
                          onChanged: (value) => model.email = value,
                          initialValue: _user?.email,
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      ProcessButton(
                        text: 'Submit',
                        onPressed: () => cubit.updateProfile(model: model),
                        buttonState: cubit.buttonState,
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
