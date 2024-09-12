
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  Map<String ,Map<String,String>> get keys=>{
    'en_US':{
      'email_hint':'Enter Email',
      'internet_exception': 'We are unable to show results\n Please check your connection',
      'retry': 'Retry',
      'general_exception': 'We are unable to process your request\n Please try again',
    },
    'ur_PK':{
      'email_hint':'ای میل درج کریں'
    },
  };

}