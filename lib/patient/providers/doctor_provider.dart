import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../utils/yaml_reader.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;

  DoctorProvider() {
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    final doctorsData = await loadYamlFile('assets/doctors.yaml');
    _doctors = doctorsData.map((doctor) {
      return Doctor(
        name: doctor['name'],
        specialization: doctor['specialization'],
        rating: doctor['rating'].toDouble(),
        imageUrl: doctor['imageUrl'],
        description: doctor['description'],
        experience: doctor['experience'],
        education: doctor['education'], // Load education
      );
    }).toList();
    notifyListeners();
  }
}
