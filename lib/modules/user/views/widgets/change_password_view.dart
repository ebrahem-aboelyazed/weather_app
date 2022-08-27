import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/common.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/utils/utils.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  String newPassword = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimensions.paddingLarge,
          Dimensions.paddingLarge,
          Dimensions.paddingLarge,
          0,
        ),
        child: Form(
          key: cubit.formKeyOne,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: Dimensions.paddingDefault),
              PasswordField(
                onChanged: (value) => newPassword = value,
                hint: 'New Password',
              ),
              const SizedBox(height: Dimensions.paddingDefault),
              ProcessButton(
                text: 'Submit',
                onPressed: () => cubit.changePassword(newPassword: newPassword),
                buttonState: cubit.buttonState,
              ),
              const SizedBox(height: Dimensions.paddingDefault),
            ],
          ),
        ),
      ),
    );
  }
}
