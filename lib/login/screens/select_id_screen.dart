import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:doctors_flutter_application/doctor/screens/doctor_home_screen.dart';
import 'package:doctors_flutter_application/patient/screens/patient_home_screen.dart';
// import 'patient_home_screen.dart';

class SelectIdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth / 4;
    final iconheight = screenheight / 6;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'SAPDOS',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 150),
                  Text(
                    'Choose your role to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorHomeScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/doctor_logo.png', // Replace with your doctor logo asset
                          width: iconSize,
                          height: iconheight,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Doctor',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientHomeScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/patient_logo.png', // Replace with your patient logo asset
                          width: iconSize,
                          height: iconheight,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Patient',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      // Handle proceed as guest
                    },
                    child: Text(
                      'Proceed as a Guest',
                      style: TextStyle(
                        color: AppColors.text,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
