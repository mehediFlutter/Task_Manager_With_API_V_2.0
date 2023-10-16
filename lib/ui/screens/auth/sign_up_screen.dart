import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/ui/screens/email_verification_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  Future<void> userSignUp() async {
    final NetworkResponse response =
        await NetworkCaller().postRequest('', <String, dynamic>{
      "email": _emailController.text.trim(),
      "firstName": _lastNameController.text.trim(),
      "lastName": _firstNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "password": _paswordController.text,
      "photo": ""
    });
    if (response.isSuccess) {
      if(mounted){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration Success")));
    }
    }
    else{
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration faild!!")));

    }
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
          key: _formkey,
          child: SingleChildScrollView(
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
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "First name",
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: "Last name"),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Mobile"),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your mobile';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _paswordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formkey.currentState!.validate()) {
                        return null;
                      }
                      userSignUp();
                    },
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
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Sign in")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
