import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/Colors/app_colors.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: Text('email_hint'.tr,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.whiteColor),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: InternetExceptionWidget(
        onPress: (){},
      ),
    );
  }
}
