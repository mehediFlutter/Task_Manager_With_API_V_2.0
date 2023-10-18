import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _signUpInProgress = false;

  Future<void> userSignUp() async {
    _signUpInProgress = true;
if(mounted){
  setState(() {
    
  });
}
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration , <String, dynamic>{
      "email": _emailController.text.trim(),
      "firstName": _lastNameController.text.trim(),
      "lastName": _firstNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "password": _passwordController.text,
      "photo": ""
    });
        _signUpInProgress = false;

    if(mounted){
  setState(() {
    
  });
}
     
    if (response.isSuccess) {
      _emailController.clear();
      _firstNameController.clear();
      _lastNameController.clear();
      _mobileController.clear();
      _passwordController.clear();
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
                  controller: _passwordController,
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
                  child: Visibility(
                    visible: _signUpInProgress==false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        userSignUp();
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
