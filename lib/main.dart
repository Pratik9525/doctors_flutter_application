// lib/main.dart

import 'package:doctors_flutter_application/login/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/utils/colors.dart';
import 'login/providers/auth_provider.dart';
import 'patient/providers/doctor_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
      ],
      child: MaterialApp(
        title: 'Sapdos',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          hintColor: AppColors.accent,
        ),
        home: AuthScreen(),
      ),
    );
  }
}
