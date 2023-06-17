import 'dart:async';
import 'package:amritmilk/theme/app_colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constant/assets.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  String userId="";
  @override
  void initState() {
    super.initState();
    getData();
    startTime();
  }

  getData(){
    userId = GetStorage().read("userId")??"";
    // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    // firebaseMessaging.getToken().then((token){
    //   print("token is $token");
    // });
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    if(userId==""){
      Get.toNamed(AppRoutes.login);
    }
    else{
      Get.toNamed(AppRoutes.dashboardScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: whiteColor,
        body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height/2,width: MediaQuery.of(context).size.width/1.3,
              child: Image.asset(Assets.splashLogo,fit: BoxFit.fill),
            )
        ),
      ),
    );
  }
}
