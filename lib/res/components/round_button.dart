import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/Colors/app_colors.dart';
class RoundButton extends StatelessWidget {
  const RoundButton({super.key,
    this.buttonColor=AppColors.primaryColor,
    this.textColor=AppColors.whiteColor,
    required this.title,
    required this.onPress,
    this.width=60,
    this.height=50,
    this.loading=false

  });

  final bool loading;
  final String title;
  final double height,width;
  final   VoidCallback onPress;
  final Color textColor,buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading?Center(child: CircularProgressIndicator(color: textColor,)):Center(child: Text(title)),
      ),
    );
  }
}
