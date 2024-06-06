import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../widgets/doctor_card.dart';
import '../utils/colors.dart';

class PatientHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final doctors = doctorProvider.doctors;

    return Scaffold(
      appBar: AppBar(
        title: Text('SAPDOS'),
        // backgroundColor: AppColors.primary,
        backgroundColor: AppColors.secondary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'SAPDOS',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            ListTile(
              leading: Icon(Icons.category, color: AppColors.primary),
              title: Text('Categories',
                  style: TextStyle(color: AppColors.primary)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: AppColors.primary),
              title: Text('Appointment',
                  style: TextStyle(color: AppColors.primary)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.chat, color: AppColors.primary),
              title: Text('Chat', style: TextStyle(color: AppColors.primary)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: AppColors.primary),
              title:
                  Text('Settings', style: TextStyle(color: AppColors.primary)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.primary),
              title: Text('Logout', style: TextStyle(color: AppColors.primary)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.background,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth >= 600;
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/images/profile.jpg'), // Use local image
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello!',
                            style:
                                TextStyle(fontSize: 24, color: AppColors.text),
                          ),
                          Text(
                            'Satish',
                            style:
                                TextStyle(fontSize: 20, color: AppColors.text),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWideScreen ? 2 : 1,
                      childAspectRatio:
                          isWideScreen ? 3.5 : 2.5, // Adjust to reduce height
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(doctor: doctors[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
