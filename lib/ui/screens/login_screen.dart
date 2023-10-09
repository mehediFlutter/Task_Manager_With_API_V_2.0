import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/utils/assets_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Text("ad"),
        ), 
        )
    );
  }
}



class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AssetsUtils.backgroundSVG,fit: BoxFit.fitHeight,),
           
          ),
           child

      ],
    );
  }
}