import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routing/app_router.dart';
import '../../../view-model/auth/auth_controller.dart';
import '../../widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32.0),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please login to your account',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  controller: emailController,
                  hintTextMessage: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                 CustomTextField(
                  controller: passwordController,
                  hintTextMessage: 'Password',
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> loginData = {
                      'email': emailController.text,
                      'password': passwordController.text,
                    };
                    authController.loginWithCred(data: loginData);
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, RoutesName.signupScreen);
                  },
                  child: const Text('Create a new account'),
                ),
                const Divider(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
