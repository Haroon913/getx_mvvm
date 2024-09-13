import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_view.dart';
import 'package:getx_mvvm/view/login/login_view.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

class AppRoutes{

  static appRoutes() =>[
    GetPage(
        name: RouteName.splash_screen,
        page: ()=> SplashScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.login_view,
        page: ()=> LoginView(),
        transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(microseconds: 300)
    ),
    GetPage(
        name: RouteName.home_view,
        page: ()=>const  HomeView(),
        transition: Transition.leftToRightWithFade,

    )
  ];
}