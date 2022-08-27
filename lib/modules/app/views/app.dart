import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:weather_app/l10n/l10n.dart';
import 'package:weather_app/modules/app/cubits/app_cubit.dart';
import 'package:weather_app/modules/app/views/splash_page.dart';
import 'package:weather_app/modules/home/cubits/home_cubit.dart';
import 'package:weather_app/modules/user/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('de'),
          Locale('es'),
          Locale('fr'),
          Locale('it'),
        ],
        home: const SplashPage(),
      ),
    );
  }
}
