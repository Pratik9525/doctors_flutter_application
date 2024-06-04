// // lib/screens/patient_detail_screen.dart
// import 'package:flutter/material.dart';
// import '../utils/colors.dart';

// class PatientDetailScreen extends StatelessWidget {
//   final String name;
//   final int age;
//   final String description;

//   PatientDetailScreen({
//     required this.name,
//     required this.age,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Details'),
//         backgroundColor: AppColors.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 40.0,
//                   backgroundImage: AssetImage(
//                       'assets/profile.png'), // Add your patient profile image here
//                 ),
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold)),
//                     Text('$age years', style: TextStyle(fontSize: 20)),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Issue description',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             ExpansionTile(
//               title: Text('Patient History'),
//               children: [
//                 ListTile(
//                   title: Text('Blood report'),
//                   trailing: Icon(Icons.visibility),
//                 ),
//                 ListTile(
//                   title: Text('CT Scan report'),
//                   trailing: Icon(Icons.visibility),
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               title: Text('Prescription'),
//               children: [
//                 ListTile(
//                   title: Text('26 March 2022'),
//                   trailing: Icon(Icons.visibility),
//                 ),
//                 ListTile(
//                   title: Text('13 April 2022'),
//                   trailing: Icon(Icons.visibility),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // lib/screens/patient_detail_screen.dart
// import 'package:flutter/material.dart';
// import '../utils/colors.dart';

// class PatientDetailScreen extends StatelessWidget {
//   final String name;
//   final int age;
//   final String description;

//   PatientDetailScreen({
//     required this.name,
//     required this.age,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Details'),
//         backgroundColor: AppColors.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey, width: 2),
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: CircleAvatar(
//                       radius: 40.0,
//                       backgroundImage: AssetImage(
//                           'assets/profile.png'), // Add your patient profile image here
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name,
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold)),
//                       Text('$age years', style: TextStyle(fontSize: 20)),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Issue description',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 description,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               _buildSection(
//                 context,
//                 title: 'Patient History',

//                 icon: Icons.history,
//                 children: [
//                   ListTile(
//                     title: Text('Blood report'),
//                     trailing: Icon(Icons.visibility),
//                   ),
//                   ListTile(
//                     title: Text('CT Scan report'),
//                     trailing: Icon(Icons.visibility),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               _buildSection(
//                 context,
//                 title: 'Prescription',
//                 icon: Icons.medication,
//                 children: [
//                   ListTile(
//                     title: Text('26 March 2022'),
//                     trailing: Icon(Icons.visibility),
//                   ),
//                   ListTile(
//                     title: Text('13 April 2022'),
//                     trailing: Icon(Icons.visibility),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.add),
//                     title: Text('Add New Prescription'),
//                     onTap: () {
//                       // Add functionality to add new prescription
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(BuildContext context,
//       {required String title,
//       required IconData icon,
//       required List<Widget> children}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,

//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ExpansionTile(
//         leading: Icon(icon, color: AppColors.primary),
//         title: Text(title),
//         children: children,
//       ),
//     );
//   }
// }

// lib/screens/patient_detail_screen.dart
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PatientDetailScreen extends StatelessWidget {
  final String name;
  final int age;
  final String description;

  PatientDetailScreen({
    required this.name,
    required this.age,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                          'assets/profile.png'), // Add your patient profile image here
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('$age years', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Issue description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              _buildSection(
                context,
                title: 'Patient History',
                icon: Icons.history,
                children: [
                  ListTile(
                    title: Text('Blood report'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                      // Implement visibility functionality
                    },
                  ),
                  ListTile(
                    title: Text('CT Scan report'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                      // Implement visibility functionality
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildSection(
                context,
                title: 'Prescription',
                icon: Icons.medication,
                children: [
                  ListTile(
                    title: Text('26 March 2022'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                      // Implement visibility functionality
                    },
                  ),
                  ListTile(
                    title: Text('13 April 2022'),
                    trailing: Icon(Icons.visibility, color: AppColors.primary),
                    onTap: () {
                      // Implement visibility functionality
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add, color: AppColors.primary),
                    title: Text('Add New Prescription'),
                    onTap: () {
                      // Add functionality to add new prescription
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title,
      required IconData icon,
      required List<Widget> children}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        backgroundColor: AppColors.primary,
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        children: children.map((child) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: child,
          );
        }).toList(),
      ),
    );
  }
}
