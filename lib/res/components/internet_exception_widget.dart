import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/Colors/app_colors.dart';
class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key,required this.onPress});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        children: [
          Icon(Icons.cloud_off,color: AppColors.primaryColor,size: 40,),
          SizedBox(height: height *.03,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('internet_exception'.tr)),
          ),
          SizedBox(height: height *.05,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('retry'.tr,style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.whiteColor),)),
            ),
          )
        ],
      ),
    );
  }
}
