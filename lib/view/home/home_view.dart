import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/Colors/app_colors.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view%20model/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view%20model/controller/user_preferences/user_preferences_view_model.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreferences userPreferences =UserPreferences();
  final homeController=Get.put(HomeViewModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser().then((value){
              Get.toNamed(RouteName.login_view);
            });
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value=='no internet'){
              return InternetExceptionWidget(onPress: (){
                // homeController.userListApi();
              });
            }
            return const Center(child: Text('Something went wrong'));
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                  ),
                  title: Text( homeController.userList.value.data![index].firstName.toString()),
                  subtitle: Text( homeController.userList.value.data![index].email.toString()),
                ),
              );

            });

        }
        return const SizedBox();
      }),
    );
  }
}
