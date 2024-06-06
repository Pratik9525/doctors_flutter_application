// lib/widgets/appointment_item.dart
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../screens/patient_detail_screen.dart';

class AppointmentItem extends StatelessWidget {
  final String time;
  final String patientName;
  final int patientAge;
  final String status;

  AppointmentItem({
    required this.time,
    required this.patientName,
    required this.patientAge,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Icon statusIcon;

    switch (status) {
      case 'completed':
        statusColor = AppColors.darkGreen;
        statusIcon = Icon(Icons.check_circle, color: AppColors.darkGreen);
        break;
      case 'pending':
      default:
        statusColor = AppColors.accent;
        statusIcon = Icon(Icons.access_time, color: AppColors.accent);
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientDetailScreen(
                name: patientName,
                age: patientAge,
                description:
                    'Issue description here', // Pass the actual description
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$patientName, $patientAge years',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              statusIcon,
            ],
          ),
        ),
      ),
    );
  }
}
