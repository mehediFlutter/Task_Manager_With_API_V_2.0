import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';
import 'package:task_manager/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager/ui/utils/assets_utils.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

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

  Future<void> navigateToLogin() async {
    final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();

    Future.delayed(const Duration(seconds: 2)).then((_) =>
    
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => isLoggedIn? const BottomNavBaseScreen(): const LoginScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(AssetsUtils.logoSVG),
        ),
      ),
    );
  }
}
