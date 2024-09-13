import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/Colors/app_colors.dart';
import 'package:getx_mvvm/view%20model/services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices =SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Text('welcome_back'.tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.whiteColor),)),
    );
  }
}
