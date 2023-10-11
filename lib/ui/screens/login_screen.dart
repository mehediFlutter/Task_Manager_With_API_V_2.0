import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screens/email_verification_screen.dart';
import 'package:task_manager/ui/utils/assets_utils.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 64,),
                      Text(
              "Get Started With",
              style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
              height: 10,
                      ),
                      const TextField(
                        keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
                      ),
                      const SizedBox(
              height: 10,
                      ),
                      const TextField(
              decoration: InputDecoration(hintText: "Password"),
                      ),
                      SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_forward),
              ),
                      ),
                      Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailVerificationScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Forget password",
                  style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                ),
              ),
                      ),
                      Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(onPressed: () {}, child: const Text("Sign up")),
              ],
                      ),
                    ],
              ),
                      ),
            )));
  }
}
