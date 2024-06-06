// lib/widgets/drawer.dart
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Text(
              'SAPDOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category, color: AppColors.text),
            title: Text('Categories', style: TextStyle(color: AppColors.text)),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: AppColors.text),
            title: Text('Appointment', style: TextStyle(color: AppColors.text)),
          ),
          ListTile(
            leading: Icon(Icons.chat, color: AppColors.text),
            title: Text('Chat', style: TextStyle(color: AppColors.text)),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: AppColors.text),
            title: Text('Settings', style: TextStyle(color: AppColors.text)),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.text),
            title: Text('Logout', style: TextStyle(color: AppColors.text)),
          ),
        ],
      ),
    );
  }
}
