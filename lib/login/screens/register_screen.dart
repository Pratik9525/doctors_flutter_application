// lib/screens/register_screen.dart

import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Handle register
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final inputFieldWidth = screenWidth / 4;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Center(
                child:
                    Image.asset('assets/doctor.png'), // Replace with your asset
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SAPDOS',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter new account\'s details',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: inputFieldWidth,
                      child: CustomTextField(
                        controller: emailController,
                        labelText: 'Email address/ Phone No.',
                        prefixIcon: Icon(Icons.email),
                        toggleVisibility: () {},
                        validator: Validators.validateEmail,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: inputFieldWidth,
                      child: CustomTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        obscureText: _obscureText1,
                        toggleVisibility: _togglePasswordVisibility1,
                        suffixIcon: Icon(
                          _obscureText1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        validator: Validators.validatePassword,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: inputFieldWidth,
                      child: CustomTextField(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        obscureText: _obscureText2,
                        toggleVisibility: _togglePasswordVisibility2,
                        suffixIcon: Icon(
                          _obscureText2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        validator: (value) =>
                            Validators.validateConfirmPassword(
                          passwordController.text,
                          value,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'SIGN-UP',
                      onPressed: _register,
                      color: AppColors.primary,
                      width: inputFieldWidth,
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Already on Sapdos? Sign-in',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
