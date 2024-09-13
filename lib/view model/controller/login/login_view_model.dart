import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view%20model/controller/user_preferences/user_preferences_view_model.dart';

import '../../../utils/utils.dart';

class LoginViewModel extends GetxController{
  final _api=LoginRepository();
  UserPreferences userPreferences=UserPreferences();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;

  RxBool loading=false.obs;

  void loginApi(){
    loading.value=true;
    Map data={
      'email':emailController.value.text,
      'password':passwordController.value.text,
    };
    _api.loginApi(data).then((value){
      loading.value=false;
      if(value['error']=='user not found'){
        Utils.snackBar('Error', 'User not found');
      }else{
        userPreferences.saveUser(UserModel.fromJson(value)).then((value){
          Get.toNamed(RouteName.home_view);
        }).onError((error,stackTrace){

        });
        Utils.snackBar('Success', 'Login Successful');
      }

    }).onError((error,stackTrace){
      print(error.toString());
      loading.value=false;
      Utils.snackBar('Error', error.toString());
    });
  }


}