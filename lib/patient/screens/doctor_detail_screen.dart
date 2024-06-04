import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/doctor.dart';
import '../utils/colors.dart';
import 'booking_appointment_screen.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor;

  DoctorDetailScreen({required this.doctor});

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  DateTime _selectedDate = DateTime.now();
  String _formattedDate = DateFormat.yMMMd().format(DateTime.now());
  int? _selectedSlotIndex;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _formattedDate = DateFormat.yMMMd().format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
        backgroundColor: AppColors.secondary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      widget.doctor.imageUrl,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. ${widget.doctor.name}',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.doctor.specialization,
                          style: TextStyle(fontSize: 18, color: AppColors.text),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              widget.doctor.rating.toString(),
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.text),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '(${512} reviews)', // Assuming 512 reviews
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.text),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: AppColors.primary),
                            SizedBox(width: 4),
                            Text(
                              '${widget.doctor.experience} Years',
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.text),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.school, color: AppColors.primary),
                            SizedBox(width: 4),
                            Text(
                              widget.doctor.education,
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.text),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text),
              ),
              SizedBox(height: 8),
              Text(
                widget.doctor.description,
                style: TextStyle(fontSize: 16, color: AppColors.text),
              ),
              SizedBox(height: 16),
              Text(
                'Available Slots',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Available Slots',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: AppColors.primary),
                    onPressed: _pickDate,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Selected Date: $_formattedDate',
                style: TextStyle(fontSize: 16, color: AppColors.text),
              ),
              SizedBox(height: 8),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double maxWidth = constraints.maxWidth;
                  final int slotsPerRow = maxWidth > 600 ? 3 : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: slotsPerRow,
                      childAspectRatio: 6,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChoiceChip(
                        label: Text('10:00 - 10:15 AM'),
                        selected: _selectedSlotIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedSlotIndex = selected ? index : null;
                          });
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookingAppointmentScreen(),
                      ),
                    );
                  },
                  child: Text('Book Appointment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
