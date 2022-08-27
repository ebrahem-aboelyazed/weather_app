import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/helpers/helpers.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  final HiveHelper _hiveHelper = HiveHelper.instance;

  Position? userLocation;

  Future<void> initialize() async {
    try {
      /// Initializing local hive database
      await _hiveHelper.initializeSettingsBox();

      /// Checking and initializing location of the user
      await _checkLocation();

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

  Future<void> _checkLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      userLocation = await Geolocator.getCurrentPosition();
    }
  }
}
