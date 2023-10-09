import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/utils/assets_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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