import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';

class BookingAppointmentScreen extends StatefulWidget {
  @override
  _BookingAppointmentScreenState createState() =>
      _BookingAppointmentScreenState();
}

class _BookingAppointmentScreenState extends State<BookingAppointmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _paymentMethod = 'Select';
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardHolderController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  int _timer = 120; // 2 minutes timer for QR code

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Widget _buildPaymentDetails() {
    switch (_paymentMethod) {
      case 'Credit Card':
      case 'Debit Card':
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your details below',
                  style: TextStyle(color: AppColors.text)),
              SizedBox(height: 8),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _cardHolderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Holder',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the card holder name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'MM/YY',
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [DateInputFormatter()],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showConfirmationDialog();
                    }
                  },
                  icon: Icon(Icons.payment),
                  label: Text('Pay now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      case 'PayPal':
        return Column(
          children: [
            SizedBox(
              width: 150, // Adjust the width
              height: 150, // Adjust the height
              child: Image.asset(
                  'assets/images/qr_code.png'), // Replace with your QR code image
            ),
            SizedBox(height: 8),
            Text('Scan the QR code to pay'),
            SizedBox(height: 16),
            Text('$_timer seconds remaining'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog();
              },
              child: Text('Confirm Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        );
      case 'Cash':
        return Center(
          child: ElevatedButton.icon(
            onPressed: () {
              _showConfirmationDialog();
            },
            icon: Icon(Icons.money),
            label: Text('Book Appointment'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 48, color: Colors.white),
              SizedBox(height: 16),
              Text(
                'Your booking is confirmed',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Okay'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (_paymentMethod == 'PayPal') {
      startTimer();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Future.delayed(oneSec, () {
      if (mounted) {
        setState(() {
          if (_timer > 0) {
            _timer--;
            startTimer();
          } else {
            // Timer finished, handle the timeout
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/doctor_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SAPDOS',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Booking Appointment',
                    style: TextStyle(fontSize: 24, color: AppColors.primary),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _paymentMethod,
                    items: [
                      'Select',
                      'Credit Card',
                      'Debit Card',
                      'PayPal',
                      'Cash'
                    ]
                        .map((method) => DropdownMenuItem(
                              child: Text(method),
                              value: method,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                        if (_paymentMethod == 'PayPal') {
                          _timer = 120; // Reset timer if PayPal is selected
                          startTimer();
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildPaymentDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Add your date formatting logic here
    return newValue;
  }
}
