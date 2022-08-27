import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/helpers/helpers.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  final HiveHelper _hiveHelper = HiveHelper.instance;

  Future<void> initialize() async {
    try {
      /// Initializing local hive database
      await _hiveHelper.initializeSettingsBox();

      /// Checking States of the app
      await checkStates();
    } catch (e) {
      emit(AppFailure(Failure(message: e.toString())));
    }
  }

  Future<void> checkStates() async {
    final hasShownIntro = await _hiveHelper.hasShownIntro;
    if (hasShownIntro) {
      final hasLoggedIn = _hiveHelper.hasLoggedIn;
      emit(hasLoggedIn ? AppAuthenticated() : AppUnAuthenticated());
    } else {
      emit(AppFirstLaunch());
    }
  }
}
