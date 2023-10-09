import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/utils/assets_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin(){
    Future.delayed(Duration(seconds: 2)).then((_) =>Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context)=>const LoginScreen()), 
      (route) => false) );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AssetsUtils.backgroundSVG,fit: BoxFit.fitHeight,),
          ),
          Center(
          child: SvgPicture.asset(AssetsUtils.logoSVG,height:80,width: 100,fit:BoxFit.scaleDown),
        ),
        
        ],
      ),
    );
  }
}

