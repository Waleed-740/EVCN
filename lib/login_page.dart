import 'package:electric_vehicle_charging_network/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String roleTitle; // Pass this from Role Screen
  const LoginScreen({super.key, required this.roleTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Role"), leading: IconButton(onPressed:(){
        Navigator.pop(context);
      },icon: const Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Chip(
                label: Text("Logging in as: $roleTitle", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                backgroundColor: Colors.green.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Email Address", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "your@email.com", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 20),
            const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(obscureText: true, decoration: InputDecoration(hintText: "........", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 10),
            const Text("Forgot password?", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if(roleTitle == 'EV Owner'){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EVDashboardScreen()));
                }else if(roleTitle == 'Administrator'){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EVDashboardScreen()));
                }
                else{

                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 20),
            const Center(child: Text.rich(TextSpan(text: "Don't have an account? ", children: [TextSpan(text: "Register", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))]))),
          ],
        ),
      ),
    );
  }
}