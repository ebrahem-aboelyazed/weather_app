import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:weather_app/helpers/helpers.dart';
import 'package:weather_app/modules/app/app.dart';
import 'package:weather_app/modules/user/user.dart';
import 'package:weather_app/utils/utils.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: [
        Slide(
          widgetTitle: const IntroTitle(title: 'Informative'),
          widgetDescription: const IntroDescription(
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                'sed do eiusmod tempor incididunt ut labore et dolore magna '
                'aliqua. Ut enim ad minim veniam',
          ),
          pathImage: 'assets/images/weather_logo.png',
          widthImage: 300,
          heightImage: 300,
          backgroundColor: const Color(0xff203152),
        ),
        Slide(
          widgetTitle: const IntroTitle(title: 'Simple'),
          widgetDescription: const IntroDescription(
            description: 'Lorem ipsum quis nostrud exercitation ullamco '
                'laboris nisi ut aliquip '
                'ea commodo consequat. Duis aute irure dolor in '
                'reprehenderit in voluptate velit esse cillum dolore eu '
                'fugiat nulla pariatur',
          ),
          pathImage: 'assets/images/weather_logo.png',
          widthImage: 300,
          heightImage: 300,
          backgroundColor: const Color(0xff305033),
        ),
        Slide(
          widgetTitle: const IntroTitle(title: 'Intuitive'),
          widgetDescription: const IntroDescription(
            description:
                'Lorem ipsum Excepteur sint occaecat cupidatat non proident, '
                'sunt in '
                'culpa qui officia deserunt mollit anim id est laborum',
          ),
          pathImage: 'assets/images/weather_logo.png',
          widthImage: 300,
          heightImage: 300,
          backgroundColor: const Color(0xff203120),
        ),
      ],
      onDonePress: () async {
        await saveIntroStatusAndNavigate(context);
      },
      onSkipPress: () async {
        await saveIntroStatusAndNavigate(context);
      },
    );
  }

  Future<void> saveIntroStatusAndNavigate(BuildContext context) async {
    final _hiveHelper = HiveHelper.instance;
    final settingsBox = _hiveHelper.settingsBox;
    await settingsBox.put(AppConstants.hasShownIntro, true);
    final hasLoggedIn = _hiveHelper.hasLoggedIn;
    if (!mounted) return;
    if (hasLoggedIn) {
      navigateAndReplace(context, const HomePage());
    } else {
      navigateAndReplace(context, LoginPage());
    }
  }
}
