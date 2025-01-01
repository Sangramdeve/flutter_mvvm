import 'package:flutter/material.dart';
import 'package:mvvm/core/routing/app_router.dart';
import 'package:mvvm/view/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
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

                  hintTextMessage: 'Password',
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () async {

                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, RoutesName.loginScreen);
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
