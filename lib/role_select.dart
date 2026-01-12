import 'package:electric_vehicle_charging_network/login_page.dart';
import 'package:flutter/material.dart';

import 'Models/data.dart';


class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Select Your Role", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Choose how you want to use the app", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            ...List.generate(MockData.roles.length, (index) {
              final role = MockData.roles[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen(
                    roleTitle: MockData.roles[index]['title']!,
                  ),));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.primaryGreen.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryGreen.withOpacity(0.1),
                        child: Icon(_getIcon(role['icon']!), color: AppColors.primaryGreen),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(role['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          Text(role['subtitle']!, style: const TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String name) {
    if (name == 'person_outline') return Icons.person_outline;
    if (name == 'home_work_outlined') return Icons.home_work_outlined;
    return Icons.verified_user_outlined;
  }
}