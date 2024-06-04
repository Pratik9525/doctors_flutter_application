import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../screens/doctor_detail_screen.dart';
import '../utils/colors.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DoctorDetailScreen(doctor: doctor),
          ),
        );
      },
      child: Card(
        color: AppColors.background,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(doctor.imageUrl),
                    radius: 25, // Reduce radius to make avatar smaller
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          doctor.specialization,
                          style: TextStyle(color: AppColors.text),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    doctor.rating.toString(),
                    style: TextStyle(color: AppColors.text),
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
