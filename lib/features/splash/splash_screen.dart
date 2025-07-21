import 'package:counter_two/features/home/home_screeN.dart';
import 'package:counter_two/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
   
    print('first method start in screen');

    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isFirstTime = prefs.getBool('isFirstTime');

      if(isFirstTime == null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
      }else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }

      print('isFirstTime $isFirstTime');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('second method start in screen');
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(child: Lottie.asset('assets/animations/cooking_food.json')),
    );
  }
}
