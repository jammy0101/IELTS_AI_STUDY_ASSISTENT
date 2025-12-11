import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ielts_ai_study/resources/routes/routes_names.dart';
import 'package:ielts_ai_study/screens/pages/home/home.dart';
import 'package:ielts_ai_study/screens/pages/login/login.dart';
import 'package:ielts_ai_study/screens/pages/math/math.dart';
import 'package:ielts_ai_study/screens/pages/mcq/mcq.dart';
import 'package:ielts_ai_study/screens/pages/profile/profile.dart';
import 'package:ielts_ai_study/screens/pages/progress/progress.dart';
import 'package:ielts_ai_study/screens/pages/registration/registration.dart';
import 'package:ielts_ai_study/screens/pages/saved/saved.dart';
import 'package:ielts_ai_study/screens/pages/summarizer/summarizer.dart';
import '../../screens/pages/feedback/feedback.dart';
import '../splash_screen/spalsh_screen.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(
      name: RoutesName.splash,
      page: () => const Splashscreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const Home(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => const Login(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.register,
      page: () => const Registration(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.summarizer,
      page: () => const Summarizer(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.mcq,
      page: () => const Mcq(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.math,
      page: () => const Math(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.profile,
      page: () => const Profile(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.progress,
      page: () => const Progress(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.saved,
      page: () =>  Saved(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.feedback,
      page: () => const FeedbackScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
