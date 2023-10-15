import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/email_verification_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            SizedBox(
              height: 64,
            ),
            Text(
              "Join with us",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "First name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "Last name"),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "Mobile"),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
             obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 10,
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
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text("Sign in")),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
