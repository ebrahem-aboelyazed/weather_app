import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show GlobalKey, FormState;
import 'package:progress_state_button/progress_button.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/modules/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final UserService _userService = UserService.instance;

  final GlobalKey<FormState> formKeyOne = GlobalKey();
  final GlobalKey<FormState> formKeyTwo = GlobalKey();

  User? get currentUser {
    final response = _userService.getCurrentUser();
    return response.fold((l) => null, (user) => user);
  }

  Stream<User?> get userStream => _userService.userStream;

  Future<void> loginUser({required LoginModel model}) async {
    if (formKeyOne.currentState != null &&
        formKeyOne.currentState!.validate()) {
      emit(UserLoading());

      final response = await _userService.loginUser(model: model);
      response.fold(onFailure, (credentials) => emit(UserLoggedIn()));
    }
  }

  Future<void> registerUser({required SignUpModel model}) async {
    if (formKeyTwo.currentState != null &&
        formKeyTwo.currentState!.validate()) {
      emit(UserLoading());

      /// First request to register user
      final response = await _userService.registerUser(model: model);
      response.fold(onFailure, (user) async {
        /// Second request to login user and retrieve credentials
        final data = await _userService.loginUser(
          model: LoginModel(email: model.email, password: model.password),
        );
        data.fold(onFailure, (credentials) => emit(UserRegistered()));
      });
    }
  }

  Future<void> changePassword({required String newPassword}) async {
    if (formKeyOne.currentState != null &&
        formKeyOne.currentState!.validate()) {
      emit(UserLoading());

      final response =
          await _userService.changePassword(newPassword: newPassword);
      response.fold(onFailure, (credentials) => emit(UserUpdated()));
    }
  }

  Future<void> updateProfile({required SignUpModel model}) async {
    if (formKeyTwo.currentState != null &&
        formKeyTwo.currentState!.validate()) {
      emit(UserLoading());
      final response = await _userService.updateProfile(model: model);
      response.fold(onFailure, (credentials) => emit(UserUpdated()));
    }
  }

  void signOutUser() {
    emit(UserLoading());
    _userService.signOutUser();
    emit(UserLoggedOut());
  }

  void onFailure(Failure failure) {
    emit(UserFailure(failure));
  }

  ButtonState get buttonState {
    if (state is UserLoading) {
      return ButtonState.loading;
    } else {
      return ButtonState.idle;
    }
  }
}
