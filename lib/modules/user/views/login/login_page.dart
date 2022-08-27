import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/common.dart';
import 'package:weather_app/modules/app/app.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/modules/user/views/widgets/custom_view.dart';
import 'package:weather_app/utils/utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final model = LoginModel();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: cubit.formKeyOne,
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserFailure) {
                  showErrorSnackBar(context, state.failure);
                } else if (state is UserLoggedIn) {
                  navigateAndReplaceAll(context, const HomePage());
                }
              },
              builder: (context, state) {
                return LoginView(cubit: cubit, state: state, model: model);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    required this.cubit,
    required this.state,
    required this.model,
    super.key,
  });

  final UserCubit cubit;
  final UserState state;
  final LoginModel model;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: state is UserLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomView(text: 'LOGIN', showBack: false),
          const SizedBox(height: Dimensions.paddingExtraLarge),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(Dimensions.paddingLarge),
              child: FadeIn(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.paddingMax),
                      EmailField(
                        onChanged: (value) => model.email = value,
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      PasswordField(
                        onChanged: (value) => model.password = value,
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      Align(
                        child: ProcessButton(
                          onPressed: () => cubit.loginUser(model: model),
                          buttonState: cubit.buttonState,
                          text: 'LOGIN',
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account yet?",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () => navigateTo(context, SignUpPage()),
                            child: const Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.paddingSmall),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
