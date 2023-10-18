import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/data/model/login_model.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager/ui/screens/email_verification_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  bool _loginInProgress = false;

  Future<void> login() async {
    _loginInProgress = true;
    if (mounted) setState(() {});
    NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, <String, dynamic>{
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    });

    _loginInProgress = false;
    if (mounted) setState(() {});
    if (response.isSuccess) {

      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);

      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login success")));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBaseScreen()),
          (route) => false);
    } else {
      if (mounted)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Faild!! incurrect email of paassword")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Get Started With",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter your email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter password";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: _loginInProgress==false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_globalKey.currentState!.validate()) {
                        return null;
                      }
                      login();
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVerificationScreen(),
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
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(16, 65, 82,82)
                    ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text("Sign up")),
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
