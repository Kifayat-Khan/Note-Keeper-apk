import 'dart:async';

import 'package:lec_14_15/View/home_screen.dart';
import 'package:lec_14_15/View/login%20_view.dart';
import 'package:lec_14_15/linker.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    wherMove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
    
          child: myText("Note Keeper", 40, Colors.lightGreen, FontWeight.w700),
          
        ),
      ),
    );
  }

  wherMove()async
  {
     SharedPreferences pref=await SharedPreferences.getInstance();
     String? uName=pref.getString('name');
    Timer(
      const Duration(
        seconds: 5),
          (() => {
          
           if (uName == null) {Get.to(LoginView())} else Get.to(const HomeScreen())
          }
         ));
   
  }
}