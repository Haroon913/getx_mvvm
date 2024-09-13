import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'dart:async';
import 'package:getx_mvvm/view%20model/controller/user_preferences/user_preferences_view_model.dart';
import '../../utils/utils.dart';

class SplashServices{
  UserPreferences userPreferences =UserPreferences();
  void isLogin() {
    userPreferences.getUser().then((value) {
      if (value.token == null || value.token!.isEmpty) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.login_view);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.home_view);
        });
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    });
  }

}