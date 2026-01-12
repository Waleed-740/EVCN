import 'package:flutter/material.dart';

import 'Models/data.dart';

class EVDashboardScreen extends StatelessWidget {
  const EVDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded List Data
    final List<Map<String, dynamic>> nearbyStations = [
      {"name": "Emporium Mall Hub", "dist": "2.3 km", "type": "Type 2", "status": "Available", "price": "Rs. 25/kWh"},
      {"name": "Packages Mall DC", "dist": "5.1 km", "type": "CCS Fast", "status": "Occupied", "price": "Rs. 35/kWh"},
      {"name": "DHA Phase 6 Point", "dist": "1.2 km", "type": "Type 2", "status": "Available", "price": "Rs. 22/kWh"},
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        title: const Text("Find Stations"),
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: Column(
        children: [
          // 1. Map View Placeholder
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primaryGreen.withOpacity(0.3)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map_outlined, size: 50, color: AppColors.primaryGreen),
                Text("Interactive Map View", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // 2. Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search location...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),

          // 3. Station List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: List.generate(nearbyStations.length, (index) {
                final station = nearbyStations[index];
                bool isAvailable = station['status'] == "Available";

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text(station['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${station['dist']} • ${station['type']} • ${station['price']}"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 12, color: isAvailable ? Colors.green : Colors.red),
                        Text(station['status'], style: TextStyle(color: isAvailable ? Colors.green : Colors.red, fontSize: 10)),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}