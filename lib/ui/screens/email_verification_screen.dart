import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/otp_verification_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                "Your email address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "A 6 digits pin will sent to your email",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpVerificationScreen()));
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
              const SizedBox(
                height: 15,
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
                  }, child: Text("Sign in")),
                ],
              )
            ],
                  ),
                ),
          )),
    );
  }
}
